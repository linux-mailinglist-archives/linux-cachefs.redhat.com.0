Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386A502A0A
	for <lists+linux-cachefs@lfdr.de>; Fri, 15 Apr 2022 14:36:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-c7VxZqYVOpiSAuAcrpCY5A-1; Fri, 15 Apr 2022 08:36:31 -0400
X-MC-Unique: c7VxZqYVOpiSAuAcrpCY5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF55B811E78;
	Fri, 15 Apr 2022 12:36:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C322A463EF4;
	Fri, 15 Apr 2022 12:36:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E00CE1940355;
	Fri, 15 Apr 2022 12:36:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DFDA519451EF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 15 Apr 2022 12:36:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE1B5C44CD9; Fri, 15 Apr 2022 12:36:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA691C44CD0
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88DC4296A621
 for <linux-cachefs@redhat.com>; Fri, 15 Apr 2022 12:36:25 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-wJFkJ8eIOBagXZcFJ5LBdg-1; Fri, 15 Apr 2022 08:36:20 -0400
X-MC-Unique: wJFkJ8eIOBagXZcFJ5LBdg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VA7Cc00_1650026174
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VA7Cc00_1650026174) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 15 Apr 2022 20:36:15 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 15 Apr 2022 20:35:53 +0800
Message-Id: <20220415123614.54024-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH v9 00/21] fscache,
 erofs: fscache-based on-demand read semantics
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: gregkh@linuxfoundation.org, fannaihao@baidu.com, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

changes since v8:
- rebase to 5.18-rc2
- cachefiles: use object_id rather than anon_fd to uniquely identify a
  cachefile object to avoid potential issues when the user moves the
  anonymous fd around, e.g. through dup() (refer to commit message and
  cachefiles_ondemand_get_fd() of patch 2 for more details)
  (David Howells)
- cachefiles: add @unbind_pincount refcount to avoid the potential deadlock
  (refer to commit message of patch3 for more details)
- cachefiles: move the calling site of cachefiles_ondemand_read() from
  cachefiles_read() to cacehfiles_prep_read() (refer to commit message
  of patch 5 for more details)
- cachefiles: add tracepoints (patch 7) (David Howells)
- cachefiles: update documentation (patch 8) (David Howells)
- erofs: update Reviewed-by tag from Gao Xiang
- erofs: move the logic of initializing bdev/dax_dev in fscache mode out
  from patch 15/20. Instead move it into patch 9, so that patch 20 can
  focus on the mount option handling
- erofs: update the subject line and commit message of patch 12 (Gao
  Xiang)
- erofs: remove and fold erofs_fscache_get_folio() helper (patch 16)
  (Gao Xiang)
- erofs: change kmap() to kamp_loacl_folio(), and comment cleanup (patch
  18) (Gao Xiang)
- update "advantage of fscache-based on-demand read" section of the
  cover letter
- we've finished a preliminary end-to-end on-demand download daemon in
  order to test the fscache on-demand kernel code as a real end-to-end
  workload for container use cases. The test user guide is added in the
  cover letter.
- Thanks Zichen Tian for testing
  Tested-by: Zichen Tian <tianzichen@kuaishou.com>


Kernel Patchset
---------------
Git tree:

    https://github.com/lostjeffle/linux.git jingbo/dev-erofs-fscache-v9

Gitweb:

    https://github.com/lostjeffle/linux/commits/jingbo/dev-erofs-fscache-v9


User Guide for E2E Container Use Case
-------------------------------------
User guide:

    https://github.com/dragonflyoss/image-service/blob/fscache/docs/nydus-fscache.md

Video:

    https://youtu.be/F4IF2_DENXo


User Daemon for Quick Test
--------------------------
Git tree:

    https://github.com/lostjeffle/demand-read-cachefilesd.git main

Gitweb:

    https://github.com/lostjeffle/demand-read-cachefilesd


RFC: https://lore.kernel.org/all/YbRL2glGzjfZkVbH@B-P7TQMD6M-0146.local/t/
v1: https://lore.kernel.org/lkml/47831875-4bdd-8398-9f2d-0466b31a4382@linux.alibaba.com/T/
v2: https://lore.kernel.org/all/2946d871-b9e1-cf29-6d39-bcab30f2854f@linux.alibaba.com/t/
v3: https://lore.kernel.org/lkml/20220209060108.43051-1-jefflexu@linux.alibaba.com/T/
v4: https://lore.kernel.org/lkml/20220307123305.79520-1-jefflexu@linux.alibaba.com/T/#t
v5: https://lore.kernel.org/lkml/202203170912.gk2sqkaK-lkp@intel.com/T/
v6: https://lore.kernel.org/lkml/202203260720.uA5o7k5w-lkp@intel.com/T/
v7: https://lore.kernel.org/lkml/557bcf75-2334-5fbb-d2e0-c65e96da566d@linux.alibaba.com/T/
v8: https://lore.kernel.org/all/ac8571b8-0935-1f4f-e9f1-e424f059b5ed@linux.alibaba.com/T/


[Background]
============
Nydus [1] is an image distribution service especially optimized for
distribution over network. Nydus is an excellent container image
acceleration solution, since it only pulls data from remote when needed,
a.k.a. on-demand reading and it also supports chunk-based deduplication,
compression, etc.

erofs (Enhanced Read-Only File System) is a filesystem designed for
read-only scenarios. (Documentation/filesystem/erofs.rst)

Over the past months we've been focusing on supporting Nydus image service
with in-kernel erofs format[2]. In that case, each container image will be
organized in one bootstrap (metadata) and (optional) multiple data blobs in
erofs format. Massive container images will be stored on one machine.

To accelerate the container startup (fetching container images from remote
and then start the container), we do hope that the bootstrap & blob files
could support on-demand read. That is, erofs can be mounted and accessed
even when the bootstrap/data blob files have not been fully downloaded.
Then it'll have native performance after data is available locally.

That means we have to manage the cache state of the bootstrap/data blob
files (if cache hit, read directly from the local cache; if cache miss,
fetch the data somehow). It would be painful and may be dumb for erofs to
implement the cache management itself. Thus we prefer fscache/cachefiles
to do the cache management instead.

The fscache on-demand read feature aims to be implemented in a generic way
so that it can benefit other use cases and/or filesystems if it's
implemented in the fscache subsystem.

[1] https://nydus.dev
[2] https://sched.co/pcdL


[Overall Design]
================
Please refer to patch 7 ("cachefiles: document on-demand read mode") for
more details.

When working in the original mode, cachefiles mainly serves as a local cache
for remote networking fs, while in on-demand read mode, cachefiles can work
in the scenario where on-demand read semantics is needed, e.g. container image
distribution.

The essential difference between these two modes is that, in original mode,
when cache miss, netfs itself will fetch data from remote, and then write the
fetched data into cache file. While in on-demand read mode, a user daemon is
responsible for fetching data and then feeds to the kernel fscache side.

The on-demand read mode relies on a simple protocol used for communication
between kernel and user daemon.

The proposed implementation relies on the anonymous fd mechanism to avoid
the dependence on the format of cache file. When a fscache cachefile is opened
for the first time, an anon_fd associated with the cache file is sent to the
user daemon. With the given anon_fd, user daemon could fetch and write data
into the cache file in the background, even when kernel has not triggered the
cache miss. Besides, the write() syscall to the anon_fd will finally call
cachefiles kernel module, which will write data to cache file in the latest
format of cache file.

1. cache miss
When cache miss, cachefiles kernel module will notify user daemon with the
anon_fd, along with the requested file range. When notified, user daemon
needs to fetch data of the requested file range, and then write the fetched
data into cache file with the given anonymous fd. When finished processing
the request, user daemon needs to notify the kernel.

After notifying the user daemon, the kernel read routine will hang there,
until the request is handled by user daemon. When it's awaken by the
notification from user daemon, i.e. the corresponding hole has been filled
by the user daemon, it will retry to read from the same file range.

2. cache hit
Once data is already ready in cache file, netfs will read from cache
file directly.


[Advantage of fscache-based on-demand read]
========================================
1. Asynchronous prefetch
In current mechanism, fscache is responsible for cache state management,
while the data plane (fetching data from local/remote on cache miss) is
done on the user daemon side even without any file system request driven.
In addition, if cached data has already been available locally, fscache
will use it instead of trapping to user space anymore.

Therefore, different from event-driven approaches, the fscache on-demand
user daemon could also fetch data (from remote) asynchronously in the
background just like most multi-threaded HTTP downloaders.

2. Flexible request amplification
Since the data plane can be independently controlled by the user daemon,
the user daemon can also fetch more data from remote than that the file
system actually requests for small I/O sizes. Then, fetched data in bulk
will be available at once and fscache won't be trapped into the user
daemon again.

3. Support massive blobs
This mechanism can naturally support a large amount of backing files,
and thus can benefit the densely employed scenarios. In our use cases,
one container image can be formed of one bootstrap (required) and
multiple chunk-deduplicated data blobs (optional).

For example, one container image for node.js will correspond to ~20
files in total. In densely employed environment, there could be hundreds
of containers and thus thousands of backing files on one machine.




Jeffle Xu (21):
  cachefiles: extract write routine
  cachefiles: notify user daemon when looking up cookie
  cachefiles: unbind cachefiles gracefully in on-demand mode
  cachefiles: notify user daemon when withdrawing cookie
  cachefiles: implement on-demand read
  cachefiles: enable on-demand read mode
  cachefiles: add tracepoints for on-demand read mode
  cachefiles: document on-demand read mode
  erofs: make erofs_map_blocks() generally available
  erofs: add fscache mode check helper
  erofs: register fscache volume
  erofs: add fscache context helper functions
  erofs: add anonymous inode caching metadata for data blobs
  erofs: add erofs_fscache_read_folios() helper
  erofs: register fscache context for primary data blob
  erofs: register fscache context for extra data blobs
  erofs: implement fscache-based metadata read
  erofs: implement fscache-based data read for non-inline layout
  erofs: implement fscache-based data read for inline layout
  erofs: implement fscache-based data readahead
  erofs: add 'fsid' mount option

 .../filesystems/caching/cachefiles.rst        | 170 ++++++
 fs/cachefiles/Kconfig                         |  11 +
 fs/cachefiles/Makefile                        |   1 +
 fs/cachefiles/daemon.c                        | 116 +++-
 fs/cachefiles/interface.c                     |   2 +
 fs/cachefiles/internal.h                      |  74 +++
 fs/cachefiles/io.c                            |  76 ++-
 fs/cachefiles/namei.c                         |  16 +-
 fs/cachefiles/ondemand.c                      | 496 ++++++++++++++++++
 fs/erofs/Kconfig                              |  10 +
 fs/erofs/Makefile                             |   1 +
 fs/erofs/data.c                               |  26 +-
 fs/erofs/fscache.c                            | 365 +++++++++++++
 fs/erofs/inode.c                              |   4 +
 fs/erofs/internal.h                           |  49 ++
 fs/erofs/super.c                              | 105 +++-
 fs/erofs/sysfs.c                              |   4 +-
 include/linux/fscache.h                       |   1 +
 include/linux/netfs.h                         |   2 +
 include/trace/events/cachefiles.h             | 176 +++++++
 include/uapi/linux/cachefiles.h               |  68 +++
 21 files changed, 1694 insertions(+), 79 deletions(-)
 create mode 100644 fs/cachefiles/ondemand.c
 create mode 100644 fs/erofs/fscache.c
 create mode 100644 include/uapi/linux/cachefiles.h

-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

