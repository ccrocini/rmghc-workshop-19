#!/usr/bin/env nextflow
params.name             = "RNA-seq"
params.reads            = "/data/fastq/*{*_R1,*_R2}.fastq.gz"
params.email		="clcr0828@colorado.edu"

log.info "RNA-seq Pipeline"
log.info "====================================="
log.info "name         : ${params.name}"
log.info "reads        : ${params.reads}"
log.info "\n"
log.info "email		: ${params.email}"


reads = Channel.fromFilePairs(params.reads, size: -1)
process vie_reads {
publishDir "results"

input:
set sample_id, file(read_files) from reads
output:
file "*.txt"
script:
"""
zcat ${read_files[[1]]} | head > ${sample_id}_reads.txt
"""

}
