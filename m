Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E317D46FBBD
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:37:00 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-4ZWJN9VVP96Fw0vAC6yCXw-1; Fri, 10 Dec 2021 02:36:56 -0500
X-MC-Unique: 4ZWJN9VVP96Fw0vAC6yCXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02DD5100C660;
	Fri, 10 Dec 2021 07:36:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 084535D9D5;
	Fri, 10 Dec 2021 07:36:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF05D1809CB9;
	Fri, 10 Dec 2021 07:36:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aSpM027765 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F069440CFD12; Fri, 10 Dec 2021 07:36:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB16C40CFD0A
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE051811E78
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:27 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-190-xA_bFnYuPGeJQSvZSwNlXw-1; Fri, 10 Dec 2021 02:36:24 -0500
X-MC-Unique: xA_bFnYuPGeJQSvZSwNlXw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R651e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8PLOD_1639121779
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8PLOD_1639121779) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:20 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:00 +0800
Message-Id: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com
Subject: [Linux-cachefs] [RFC 00/19] fscache,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[Background]
============
erofs (Enhanced Read-Only File System) is a filesystem specially
optimised for read-only scenarios. (Documentation/filesystem/erofs.rst)

Recently we are focusing on erofs in container images distribution
scenario (https://sched.co/pcdL). In this case, erofs can be mounted
from one bootstrap file (metadata) with (optional) multiple data blob
files (data) stored on another local filesystem. (All these files are
actually image files in erofs disk format.)

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
<root>/cache/<volume>) in advance. These backing files are completely
sparse files (with zero disk usage). Since these backing files are all
read-only and the file size is fixed, user daemon will set corresponding
file size and thus create all these sparse backing files in advance.

2. cache miss
When a file range (of bootstrap/data blob file) is accessed for the
first time, a cache miss will be triggered and then .issue_op() will be
called to fetch the data somehow.

In the demand-read case, we relies on a user daemon to fetch the data
from local/remote. In this case, .issue_op() just packages the file
range into a message and informs the user daemon, which was polling and
waiting on /dev/cachefiles. Once awaken, the user daemon will then read
/dev/cachefiles to get the file range information, and go to fetch the
data corresponding to the file range. Once data ready, the user daemon
will write the fetched data into the backing file and then inform the
previous .issue_op() by writing to /dev/cachefiles. The previous
.issue_op() calling will be blocked there until it is informed by the
user daemon that the data has been ready. By then the data has been
ready in the backing file, and the netfs API will re-initiate a read
request from the backing file.

3. cache hit
Once data is already ready in the backing file, netfs API will read from
the backing file directly.


[Advantage of fscache-based demand-read]
========================================
1. Asynchronous Prefetch
In current mechanism, fscache is responsible for cache state management,
while the data plane (fetch data from local/remote on cache miss) is
done on the user daemon side.

If data has already been ready in the backing file, netfs API will read
from the backing file directly and won't be trapped to user space anymore.
Thus the user daemon could fetch data (from remote) asynchronously on the
background, and thus accelerate the backing file accessing in some degree.

2. Support massive blob files
Besides this mechanism supports a large amount of backing files, and
thus can benefit the densely employed scenario.

In our using scenario, one container image can correspond to one
bootstrap file (required) and multiple data blob files (optional). For
example, one container image for node.js will corresponds to ~20 files
in total. In densely employed environment, there could be as many as
hundreds of containers and thus thousands of backing files on one
machine.


[Invalidation Strategy]
=======================
Currently I have no clear idea on the invalidation (culling) strategy
yet... It needs further discussion and then gets implemented later.


[Patchset Organization]
=======================
- patch 1-16 implement the data plane over fscache. Until then erofs
  could access the bootstrap blob file (backing file) with fscache,
  though the backing file needs to be ready (fully downloaded).
- patch 17-19 implement the demand-read semantics. Then it will rely on
  the user daemon to fetch the data once the backing file has not been
  ready (cache miss).


[Interaction with fscache/cachefiles/netfs]
===========================================
fscache/cachefiles/netfs are initially designed to serve as a local
cache for remote filesystems. As they are used to implement the
demand-read semantics, the logic may need to be twisted somehow.

This RFC pathset is still quite coarse and is only used to show the
skeleton of the whole mechanism. Thus to get a workable model as soon as
possible, the refactoring to fscache/cachefiles/netfs in this pathset is
quite rough. (sorry for that...) Further discussion and clarification is
obviously needed.

1. The path of the backing file
In cachefiles, the backing file will be stored under one fan
sub-directory according to a hashing algorithm. While in our using
scenario, user daemon need to touch bootstrap/data blob file under
correct directory in advance.

In this RFC patchset, I directly passthrough the placing algorithm
(patch 2) for convenience of debug. But in the later version, we can
make the hashing algorithm used by cachefiles built-in into the user
daemon, and let user daemon compute the corresponding hash value and
place bootstrap/data blob file under right directory. The goal is to
keep cachefiles' placing logic untouched as much as possible.

2. Upper fs doesn't know file size in advance
The @object_size parameter of fscache_acquire_cookie() represents the
file size of the netfs file, and serves in several places.

- the size of the backing file will be set to @object_size during the
  cookie lookup phase.
- @object_size will be used to do the coherency checking (compared with
  the file size in "CacheFiles.cache" xattr) during the cookie lookup
  phase.
- netfs API will check if the current readed file range hits EOF
  according to the file size.

While in demand-read case, the upper fs has no idea of the file size of
the blob file. Besides, since these files are all read-only, the file
size is fixed and (as described in 'initial phase') user daemon has set
corresponding file size (of sparse files), maybe fscache could query the
file size of the backing file directly, e.g. through fstat on the
backing file, instead of relying on upper fs to offer the credible file
size.

Similarly patch 3/10/11 in this RFC just skip the related checking and
logic for demand-read case.

3. Refactor the address_space based netfs_readpage() API
The @folio parameter of netfs_readpage() indicates a page cache in the
address_space of the netfs file, and thus the following logic of netfs
API will directly copy data to the page cache in the address_space,
leaving the @folio parameter aside.

While in demand-read case, the input @folio is no longer a page cache in
the address_space of one file. Instead, it may be just a temporary page
used to contain the data. Thus netfs API needed to be refactored somehow
to adapt to this change.

Patch 8/9 in this RFC are for this purpose.

4. Maybe need another device node
In demand-read case, we rely on the user daemon to fetch data from
local/remote. Currently we re-use "/dev/cachefiles" for the
communication between fscache kernel module and user daemon. It's
obviously not acceptable since "/dev/cachefiles" is only for culling.
Later we could create another device node for this purpose.


[Test]
======
1. create erofs image (bootstrap)
mkfs.erofs test.img tmp/

2. move bootstrap to corresponding place under the root directory of
fscache

3. run user daemon
(https://github.com/lostjeffle/demand-read-cachefilesd/blob/main/cachefilesd2.c)
./cachefilesd2

4. mount erofs from bootstrap
mount -t erofs none -o bootstrap_path=test.img /mnt/



Jeffle Xu (19):
  cachefiles: add mode command
  cachefiles: implement key scheme for demand-read mode
  cachefiles: refactor cachefiles_adjust_size()
  netfs: make ops->init_rreq() optional
  netfs: refactor netfs_alloc_read_request
  netfs: add type field to struct netfs_read_request
  netfs: add netfs_readpage_demand()
  netfs: refactor netfs_clear_unread()
  netfs: refactor netfs_rreq_unlock()
  netfs: refactor netfs_rreq_prepare_read
  cachefiles: refactor cachefiles_prepare_read
  erofs: export erofs_map_blocks
  erofs: add bootstrap_path mount option
  erofs: introduce fscache support
  erofs: implement fscache-based metadata read
  erofs: implement fscache-based data read
  netfs: support on demand read
  cachefiles: support on demand read
  erofs: support on demand read

 fs/cachefiles/daemon.c    | 183 ++++++++++++++++++++++++++++----------
 fs/cachefiles/interface.c |   4 +
 fs/cachefiles/internal.h  |  22 +++++
 fs/cachefiles/io.c        |  59 +++++++++++-
 fs/cachefiles/namei.c     |   8 +-
 fs/cachefiles/xattr.c     |   5 ++
 fs/ceph/addr.c            |   5 --
 fs/erofs/Makefile         |   2 +-
 fs/erofs/data.c           |  18 ++--
 fs/erofs/fscache.c        | 161 +++++++++++++++++++++++++++++++++
 fs/erofs/inode.c          |   6 +-
 fs/erofs/internal.h       |  15 ++++
 fs/erofs/super.c          |  55 ++++++++++--
 fs/netfs/read_helper.c    | 179 +++++++++++++++++++++++++++++++++----
 include/linux/netfs.h     |  16 ++++
 15 files changed, 652 insertions(+), 86 deletions(-)
 create mode 100644 fs/erofs/fscache.c

-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

