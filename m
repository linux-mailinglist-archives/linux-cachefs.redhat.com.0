Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHVYS2YAMGQEN7B2HBY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAFF89053D
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:34:39 +0100 (CET)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c3be3eb29dsf1276041b6e.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:34:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643678; cv=pass;
        d=google.com; s=arc-20160816;
        b=J+WRZps42Zca9bdkB6B78CQ1QFeoH94YI0tzAKlqQ5yhqvJXLsjAKPp+WNsJbfvpS8
         reRVyIPXLmboUDb5PYpRz3ORtkA0EXWbQIQpAQdSK7Aj07jHh8g6rlzwvSPRwNkUrBci
         Ora5Fkxn8vnr+Vw4iF4B5oqUF3jRRgo3Uzr9A3aAFejseqMoxJXHkHehznuLKzSRnGXn
         utMLPp42XLe3oiYK2xIpsjrmCo32p40gh6gU1FpHxnLTp10zjn4bfxxVUHDjtEsP/yeI
         fZE8vCeLSsscYZM6dQrjoF3ONCotS+SKfk6zEam3uho1+UThox+UQ56bTBH0ank0veII
         7V3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=Zc+ugf1e533HudzoBEclc13mBwC0G0ztPxW8bWc9bPw=;
        fh=tq4zRGqHdq1Z3+ZTSj3evIcV2oesDRyujMXVLtGqlWU=;
        b=0vtBOSJsqqTCWfQo4YTl+LjbRGLviexy6eybEaDswXNFtc+I5QFU2kezVfmn9VAnyE
         pHOICFLJEi5dHjgvTs34IbN5WUZgKGJPW454v24nSUUmyAuH8Xmykr64nJWBXyij0Slo
         byVsYWk4JykHYyVXbathEO4/hy4EZ1k0ULtuAJaSq8s824F8tr+q8PEuXYYJmRzU1wXV
         EHncWz5LEyB2CxV/TSI2BRlwxXzH0/pNfOMokWtfTITXcD7hwtzSV+A0KdKz68x44KBH
         TZQLEaDBLH9276HSpDQWqveclJAy/ApL6P+i1uWAyKlX7nfHkMB1fsnsizGI8ubzlZGD
         smwQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643678; x=1712248478;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc+ugf1e533HudzoBEclc13mBwC0G0ztPxW8bWc9bPw=;
        b=SmxxzYn166PZq+31OGFDmm3OS8LaZHQMm09ybRVgYHEKIByMH1nTCmrJdsnVxXhjaY
         JlYsVda30MrCuf5B1aHk7n1ZXfgT1eiCoBtY365o7WY0oRs9XBsWq7F6wMgz88h89llW
         7Zm6wgwa49nRN2vacKWk/mAvcqOdwU2c5jaV8f5ksPxaKmgqbBmBmBq9FuDPVpB63UGF
         T9Z0wFH5EwsxOjdDFWJEVSZXo5wD6538v4kSawmBVbiEmEe7Q7mnWZSCpo17A4wZtcbt
         U5hvK/2F1ARAGAdZ3lIuFk6N0UipygBD3QrwXGJbYXpyffEZaLbQPnCVh7c+swrqz6Cr
         cj/w==
X-Forwarded-Encrypted: i=2; AJvYcCUkYoFOB/MCockgQuDQ1+rgbDo1puLvBqC7RnrIgH/Mps/W+8O5yNW9muWIl0zmWDfv2A5pTo5jZomI9OVGOG9hOgweJw/VnCytG5Q=
X-Gm-Message-State: AOJu0Yz7xUlEyBDTXADgdu+UB+rTUfc79g0180bJdNh9D6MAsZKI3ZvM
	h40WRsHZw4iP6jAJdtS54KJzxloi058dyONnyq9wr0AJagjtkIKYxLKZ9HNgKVo=
X-Google-Smtp-Source: AGHT+IHGhUrofVXJyV4EQQHbWmyEpUBzxJNikylbjbq86ElBXAOX9wBj2Lg1BsjDV0MnARKEhO3+YQ==
X-Received: by 2002:a05:6808:2e94:b0:3c3:aa9b:1d3e with SMTP id gt20-20020a0568082e9400b003c3aa9b1d3emr4435075oib.22.1711643678337;
        Thu, 28 Mar 2024 09:34:38 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1887:b0:431:760f:beb1 with SMTP id
 v7-20020a05622a188700b00431760fbeb1ls1593315qtc.1.-pod-prod-08-us; Thu, 28
 Mar 2024 09:34:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNQCL6j+SOqB1rDfPDWTUPVmigksYgo55ziLAqzdiRCLj72qi34jESof2DaTfE1bmuBoOu7j4Jd+nxKaxew57Q+Uz0AdoUmhdvP126/9Y=
X-Received: by 2002:a05:622a:2d4:b0:431:3d27:9ab8 with SMTP id a20-20020a05622a02d400b004313d279ab8mr4037830qtx.24.1711643677496;
        Thu, 28 Mar 2024 09:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643677; cv=none;
        d=google.com; s=arc-20160816;
        b=Y515d7CPDXy7wISelWIXDUO1A6dN52l8tVU6uCo753AXtsOTZu0W+6Lf11EScKA7Wb
         Pa4s+9vPU0Ju+dMF0xklLKRnFGAb4pgmq4/Z4g5+Ct7N26lR0Zsn+PP3yKXeOXh04L9t
         yseUs2m4mSc8HEkgyts2MsB7n/WONmogArePCCEGFxoz2O+VTlf2E7F3G5HFQERL7opb
         9uXwxKzBgAm2LaEB/qw7yv/acRqGnViOMAvLhKcAAtTgaXXFw8wecHBPOc+clRZbJzCt
         VwI0LZmwbzIDVSebSEy3lOddRCG6bNORYCChvtYYfhuopGG4zjWh4rYK0l4tkPrJhs8n
         QOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=ffhOAbislEtDui9sz/UMzHfpFDxhB+Cw1cNj4X99Z0A=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=MleSQLEkiVzIHIxxrDihEN0XgzVFCmhMcHzqgm4HcamuVtPu/ejbw2TZtwclU+HuKT
         3kV2JuQumbVAipbyRE72b+Mfg4lXi5QiyxzPo7dISAD5woqtE0KUijMRYPXWRXYTA3jD
         kT1PVedM4RDldplrDsKcXwBjBUkxQW1sz3NCvoG1yzaOUSLvILsZeyMyHF6e3YrGgLGa
         2Y+/MEVHp9ibW+nnjoaJ9l7ZZ5ULw9WO3lzIEgiIfAQqaH1TVcEg8i+1fFQiyhE9kT/R
         hZfmRT8g03EfYMtV+VQiRFP+wk8afP8QxHG390QXEMxHc1kEPagEhcJgg/Ml3XhNUTHx
         vZqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id i9-20020ac85e49000000b004314cf2bba9si1697869qtx.110.2024.03.28.09.34.37
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-b6Pt8AUANCiYFfQnHsFlrw-1; Thu, 28 Mar 2024 12:34:35 -0400
X-MC-Unique: b6Pt8AUANCiYFfQnHsFlrw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52F2B800264
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:34:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4F7A8492BCB; Thu, 28 Mar 2024 16:34:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4330492BC6;
	Thu, 28 Mar 2024 16:34:31 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/26] netfs, afs, 9p, cifs: Rework netfs to use ->writepages() to copy to cache
Date: Thu, 28 Mar 2024 16:33:52 +0000
Message-ID: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Hi Christian, Willy,

The primary purpose of these patches is to rework the netfslib writeback
implementation such that pages read from the cache are written to the cache
through ->writepages(), thereby allowing the fscache page flag to be
retired.

The reworking also:

 (1) builds on top of the new writeback_iter() infrastructure;

 (2) makes it possible to use vectored write RPCs as discontiguous streams
     of pages can be accommodated;

 (3) makes it easier to do simultaneous content crypto and stream division.

 (4) provides support for retrying writes and re-dividing a stream;

 (5) replaces the ->launder_folio() op, so that ->writepages() is used
     instead;

 (6) uses mempools to allocate the netfs_io_request and netfs_io_subrequest
     structs to avoid allocation failure in the writeback path.

Some code that uses the fscache page flag is retained for compatibility
purposes with nfs and ceph.  The code is switched to using the synonymous
private_2 label instead and marked with deprecation comments.  I have a
separate set of patches that convert cifs to use this code.

-~-

In this new implementation, writeback_iter() is used to pump folios,
progressively creating two parallel, but separate streams.  Either or both
streams can contain gaps, and the subrequests in each stream can be of
variable size, don't need to align with each other and don't need to align
with the folios.  (Note that more streams can be added if we have multiple
servers to duplicate data to).

Indeed, subrequests can cross folio boundaries, may cover several folios or
a folio may be spanned by multiple subrequests, e.g.:

         +---+---+-----+-----+---+----------+
Folios:  |   |   |     |     |   |          |
         +---+---+-----+-----+---+----------+

           +------+------+     +----+----+
Upload:    |      |      |.....|    |    |
           +------+------+     +----+----+

         +------+------+------+------+------+
Cache:   |      |      |      |      |      |
         +------+------+------+------+------+

Data that got read from the server that needs copying to the cache is
stored in folios that are marked dirty and have folio->private set to a
special value.

The progressive subrequest construction permits the algorithm to be
preparing both the next upload to the server and the next write to the
cache whilst the previous ones are already in progress.  Throttling can be
applied to control the rate of production of subrequests - and, in any
case, we probably want to write them to the server in ascending order,
particularly if the file will be extended.

Content crypto can also be prepared at the same time as the subrequests and
run asynchronously, with the prepped requests being stalled until the
crypto catches up with them.  This might also be useful for transport
crypto, but that happens at a lower layer, so probably would be harder to
pull off.

The algorithm is split into three parts:

 (1) The issuer.  This walks through the data, packaging it up, encrypting
     it and creating subrequests.  The part of this that generates
     subrequests only deals with file positions and spans and so is usable
     for DIO/unbuffered writes as well as buffered writes.

 (2) The collector.  This asynchronously collects completed subrequests,
     unlocks folios, frees crypto buffers and performs any retries.  This
     runs in a work queue so that the issuer can return to the caller for
     writeback (so that the VM can have its kswapd thread back) or async
     writes.

     Collection is slightly complex as the collector has to work out where
     discontiguities happen in the folio list so that it doesn't try and
     collect folios that weren't included in the write out.

 (3) The retryer.  This pauses the issuer, waits for all outstanding
     subrequests to complete and then goes through the failed subrequests
     to reissue them.  This may involve reprepping them (with cifs, the
     credits must be renegotiated and a subrequest may need splitting), and
     doing RMW for content crypto if there's a conflicting change on the
     server.

David

David Howells (26):
  cifs: Fix duplicate fscache cookie warnings
  9p: Clean up some kdoc and unused var warnings.
  netfs: Update i_blocks when write committed to pagecache
  netfs: Replace PG_fscache by setting folio->private and marking dirty
  mm: Remove the PG_fscache alias for PG_private_2
  netfs: Remove deprecated use of PG_private_2 as a second writeback
    flag
  netfs: Make netfs_io_request::subreq_counter an atomic_t
  netfs: Use subreq_counter to allocate subreq debug_index values
  mm: Provide a means of invalidation without using launder_folio
  cifs: Use alternative invalidation to using launder_folio
  9p: Use alternative invalidation to using launder_folio
  afs: Use alternative invalidation to using launder_folio
  netfs: Remove ->launder_folio() support
  netfs: Use mempools for allocating requests and subrequests
  mm: Export writeback_iter()
  netfs: Switch to using unsigned long long rather than loff_t
  netfs: Fix writethrough-mode error handling
  netfs: Add some write-side stats and clean up some stat names
  netfs: New writeback implementation
  netfs, afs: Implement helpers for new write code
  netfs, 9p: Implement helpers for new write code
  netfs, cachefiles: Implement helpers for new write code
  netfs: Cut over to using new writeback code
  netfs: Remove the old writeback code
  netfs: Miscellaneous tidy ups
  netfs, afs: Use writeback retry to deal with alternate keys

 fs/9p/vfs_addr.c             |  60 +--
 fs/9p/vfs_inode_dotl.c       |   4 -
 fs/afs/file.c                |   8 +-
 fs/afs/internal.h            |   6 +-
 fs/afs/validation.c          |   4 +-
 fs/afs/write.c               | 187 ++++----
 fs/cachefiles/io.c           |  75 +++-
 fs/ceph/addr.c               |  24 +-
 fs/ceph/inode.c              |   2 +
 fs/netfs/Makefile            |   3 +-
 fs/netfs/buffered_read.c     |  40 +-
 fs/netfs/buffered_write.c    | 832 ++++-------------------------------
 fs/netfs/direct_write.c      |  30 +-
 fs/netfs/fscache_io.c        |  14 +-
 fs/netfs/internal.h          |  55 ++-
 fs/netfs/io.c                | 155 +------
 fs/netfs/main.c              |  55 ++-
 fs/netfs/misc.c              |  10 +-
 fs/netfs/objects.c           |  81 +++-
 fs/netfs/output.c            | 478 --------------------
 fs/netfs/stats.c             |  17 +-
 fs/netfs/write_collect.c     | 813 ++++++++++++++++++++++++++++++++++
 fs/netfs/write_issue.c       | 673 ++++++++++++++++++++++++++++
 fs/nfs/file.c                |   8 +-
 fs/nfs/fscache.h             |   6 +-
 fs/nfs/write.c               |   4 +-
 fs/smb/client/cifsfs.h       |   1 -
 fs/smb/client/file.c         | 136 +-----
 fs/smb/client/fscache.c      |  16 +-
 fs/smb/client/inode.c        |  27 +-
 include/linux/fscache.h      |  22 +-
 include/linux/netfs.h        | 196 +++++----
 include/linux/pagemap.h      |   1 +
 include/net/9p/client.h      |   2 +
 include/trace/events/netfs.h | 249 ++++++++++-
 mm/filemap.c                 |  52 ++-
 mm/page-writeback.c          |   1 +
 net/9p/Kconfig               |   1 +
 net/9p/client.c              |  49 +++
 net/9p/trans_fd.c            |   1 -
 40 files changed, 2492 insertions(+), 1906 deletions(-)
 delete mode 100644 fs/netfs/output.c
 create mode 100644 fs/netfs/write_collect.c
 create mode 100644 fs/netfs/write_issue.c

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

