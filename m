Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE64AE9A9
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Feb 2022 07:01:34 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-4W4YH_-8PtuFxXUgLyKqow-1; Wed, 09 Feb 2022 01:01:31 -0500
X-MC-Unique: 4W4YH_-8PtuFxXUgLyKqow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F387B814251;
	Wed,  9 Feb 2022 06:01:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32CA055F6D;
	Wed,  9 Feb 2022 06:01:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C00B1809C87;
	Wed,  9 Feb 2022 06:01:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21961Jnx002626 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 01:01:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 32090401411; Wed,  9 Feb 2022 06:01:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6CCC401DB6
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD2C4802D1F
	for <linux-cachefs@redhat.com>; Wed,  9 Feb 2022 06:01:18 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-627-mQJdM-CnNRu8SoJ0OC6coA-1; Wed, 09 Feb 2022 01:01:14 -0500
X-MC-Unique: mQJdM-CnNRu8SoJ0OC6coA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V3zaQQM_1644386468
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V3zaQQM_1644386468) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 09 Feb 2022 14:01:09 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Wed,  9 Feb 2022 14:00:46 +0800
Message-Id: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org
Subject: [Linux-cachefs] [PATCH v3 00/22] fscache,
	erofs: fscache-based demand-read semantics
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

changes since v2:
- fscache,erofs: Now erofs uses fscache_read() directly instead of netfs
  library to read data from cache, to avoid the potential conflict with
  the following netfs library refactoring [1] (patch 12) (David Howells)
- erofs: Implement fscache-based readahead. The current implementation
  is quite rough and is synchronous though. Need to be improved in the
  following iteration.
- cachefiles_ondemand: use xarray instead of IDR managing pending read
  requests (patch 5) (Matthew Wilcox)
- I also upload this patch set at:
  https://github.com/lostjeffle/linux/commits/jingbo/dev-erofs-fscache

[1] https://lore.kernel.org/all/2946d871-b9e1-cf29-6d39-bcab30f2854f@linux.alibaba.com/t/#mfbb2053476760d8fac723c57dad529192a5084c6

RFC: https://lore.kernel.org/all/YbRL2glGzjfZkVbH@B-P7TQMD6M-0146.local/t/
v1: https://lore.kernel.org/lkml/47831875-4bdd-8398-9f2d-0466b31a4382@linux.alibaba.com/T/
v2: https://lore.kernel.org/all/2946d871-b9e1-cf29-6d39-bcab30f2854f@linux.alibaba.com/t/


[Background]
============
Nydus is a remote container snapthotter specially optimised for container
images distribution over network. It has recently been accepted as a
sub-project of containerd[1]. Nydus is an excellent container image
acceleration solution, since it only pulls data from remote when it's
really needed, a.k.a. on-demand reading.

erofs (Enhanced Read-Only File System) is a filesystem specially
optimised for read-only scenarios. (Documentation/filesystem/erofs.rst)

Recently we are focusing on erofs in container images distribution
scenario [2], trying to combine it with nydus. In this case, erofs can
be mounted from one bootstrap file (metadata) with (optional) multiple
data blob files (data) stored on another local filesystem. (All these
files are actually image files in erofs disk format.)

To accelerate the container startup (fetching container image from remote
and then start the container), we do hope that the bootstrap blob file
could support demand read. That is, erofs can be mounted and accessed
even when the bootstrap/data blob files have not been fully downloaded.

That means we have to manage the cache state of the bootstrap/data blob
files (if cache hit, read directly from the local cache; if cache miss,
fetch the data somehow). It would be painful and may be dumb for erofs to
implement the cache management itself. Thus we prefer fscache/cachefiles
to do the cache management. Besides, the demand-read feature shall be
general and it can benefit other using scenarios if it can be implemented
in fscache level.

[1] https://d7y.io/en-us/blog/containerd_accepted_nydus-snapshotter.html
[2] https://sched.co/pcdL


[Overall Design]
================
The upper fs uses a backing file on the local fs as the local cache
(exactly the "cachefiles" way), and relies on fscache to detect if data
is ready or not (cache hit/miss). Since currently fscache detects cache
hit/miss by detecting the hole of the backing files, our demand-read
mechanism also relies on the hole detecting.

1. initial phase
On the first beginning, the user daemon will touch the backing files
(bootstrap/data blob files) under corresponding directory (under
<root>/cache/<volume>/<fan>/) in advance. These backing files are
completely sparse files (with zero disk usage). Since these backing
files are all read-only and the file size is known prior mounting, user
daemon will set corresponding file size and thus create all these sparse
backing files in advance.

2. cache miss
When a file range (of bootstrap/data blob file) is accessed for the
first time, a cache miss will be triggered and then .issue_op() will be
called to fetch the data somehow.

In the demand-read case, we relies on a user daemon to fetch the data
from local/remote. In this case, .issue_op() just packages the file
range into a message and informs the user daemon. User daemon needs to
poll and wait on the devnode (/dev/cachefiles_demand). Once awaken, the
user daemon will read the devnode to get the file range information, and
then fetch the data corresponding to the file range somehow, e.g.
download from remote through network. Once data ready, the user daemon
will write the fetched data into the backing file and then inform
cachefiles backend by writing to the devnode. Cachefiles backend getting
blocked on the previous .issue_op() calling will be awaken then. By then
the data has been ready in the backing file, and the upper fs will
reinitiate a read request from the backing file.

3. cache hit
Once data is already ready in the backing file, upper fs will read from
the backing file directly.


[Advantage of fscache-based demand-read]
========================================
1. Asynchronous Prefetch
In current mechanism, fscache is responsible for cache state management,
while the data plane (fetch data from local/remote on cache miss) is
done on the user daemon side.

If data has already been ready in the backing file, the upper fs (e.g.
erofs) will read from the backing file directly and won't be trapped to
user space anymore. Thus the user daemon could fetch data (from remote)
asynchronously on the background, and thus accelerate the backing file
accessing in some degree.

2. Support massive blob files
Besides this mechanism supports a large amount of backing files, and
thus can benefit the densely employed scenario.

In our using scenario, one container image can correspond to one
bootstrap file (required) and multiple data blob files (optional). For
example, one container image for node.js will corresponds to ~20 files
in total. In densely employed environment, there could be as many as
hundreds of containers and thus thousands of backing files on one
machine.


[Test]
==========
You could start a quick test by
https://github.com/lostjeffle/demand-read-cachefilesd



Jeffle Xu (22):
  fscache: export fscache_end_operation()
  fscache: add a method to support on-demand read semantics
  cachefiles: extract generic function for daemon methods
  cachefiles: detect backing file size in on-demand read mode
  cachefiles: introduce new devnode for on-demand read mode
  erofs: use meta buffers for erofs_read_superblock()
  erofs: export erofs_map_blocks()
  erofs: add mode checking helper
  erofs: register global fscache volume
  erofs: add cookie context helper functions
  erofs: add anonymous inode managing page cache of blob file
  erofs: add erofs_fscache_read_page() helper
  erofs: register cookie context for bootstrap blob
  erofs: implement fscache-based metadata read
  erofs: implement fscache-based data read for non-inline layout
  erofs: implement fscache-based data read for inline layout
  erofs: register cookie context for data blobs
  erofs: implement fscache-based data read for data blobs
  erofs: implement fscache-based data readahead for hole
  erofs: implement fscache-based data readahead for non-inline layout
  erofs: implement fscache-based data readahead for inline layout
  erofs: add 'uuid' mount option

 Documentation/filesystems/netfs_library.rst |  18 +
 fs/cachefiles/Kconfig                       |  13 +
 fs/cachefiles/daemon.c                      | 243 +++++++++--
 fs/cachefiles/internal.h                    |  12 +
 fs/cachefiles/io.c                          |  60 +++
 fs/cachefiles/main.c                        |  27 ++
 fs/cachefiles/namei.c                       |  60 ++-
 fs/erofs/Makefile                           |   3 +-
 fs/erofs/data.c                             |  18 +-
 fs/erofs/fscache.c                          | 451 ++++++++++++++++++++
 fs/erofs/inode.c                            |   6 +-
 fs/erofs/internal.h                         |  30 ++
 fs/erofs/super.c                            | 106 ++++-
 fs/fscache/internal.h                       |  11 -
 fs/nfs/fscache.c                            |   8 -
 include/linux/fscache.h                     |  39 ++
 include/linux/netfs.h                       |   4 +
 include/uapi/linux/cachefiles_ondemand.h    |  14 +
 18 files changed, 1050 insertions(+), 73 deletions(-)
 create mode 100644 fs/erofs/fscache.c
 create mode 100644 include/uapi/linux/cachefiles_ondemand.h

-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

