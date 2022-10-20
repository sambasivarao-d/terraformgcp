import logging

from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.io.gcp.bigquery import WriteToBigQuery
from apache_beam.io import ReadFromParquet
from apache_beam import Flatten, Pipeline


class ProcessorOptions(PipelineOptions):
    """
    This is the Pipeline Options class required to pass Runtime Values to our pipeline, variables are defined here.
    """

    @classmethod
    def _add_argparse_args(cls, parser):
        parser.add_value_provider_argument(
            '--rawfilename',
            default='gs://gcs-bucket-landingzone-sapbw-stockonline/default_not_available.parquet',
            type=str,
            required=False,
            help='Input file to read. This is a file in Google Cloud Storage Bucket.')

        parser.add_value_provider_argument(
            '--tablename',
            default='any-table-name',
            type=str,
            required=False,
            help='Fully qualified name for BigQuery Table.')


def run_pipeline(argv=None):
    """
    This is the main pipeline code, which gets convert to template and creates the overall flow of data in form of pipeline.
    ReadFromParquet takes the path of Raw file to be processed and makes PCollection of data, the Pcollection is native
    distributed data object of Apache Beam.
    WriteToBigquery takes the PCollection of data and ingest it into BigQuery Table(Source Data Product) defined at
    runtime by doing runtime schema validation of each element of input PCollection.
    """
    try:
        processor_options = PipelineOptions().view_as(ProcessorOptions)
        pipeline = Pipeline(options=processor_options)
        write_data = (pipeline | 'Read from Raw parquet file ' >> ReadFromParquet(
            processor_options.rawfilename) | 'Populate Source Data Product BQ Table' >> WriteToBigQuery(
            table=processor_options.tablename, write_disposition='WRITE_APPEND'))
        (write_data.destination_load_jobid_pairs, write_data.destination_copy_jobid_pairs) | Flatten()

        pipeline.run().wait_until_finish()

    except Exception as e:
        logging.error("Exception encountered while running Processor pipeline : " + str(e))
