Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC91E60F28C
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 10:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666859800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y4ySj/DCtRUvo/lP4Lzxza8tsljXh3fdIpQbSxmL394=;
	b=SB2jUJdura0lHX3sr5KIiIhZE6O1SS0eur2aQWTG39b8E+C+4Snp8l6wVQ4sWvaOT4qaVH
	PmSWSDBdea0rq+2j/JyLyBT9JSkp+HhhJnG+09NXtjQ3vpgCWbyonPbxThs35HLMzxyCWb
	yOOCZIm/GGFIcZSmMb3y1nbmNaVuAdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-jb_c8dP1OpuXw5gDS0xjOg-1; Thu, 27 Oct 2022 04:36:37 -0400
X-MC-Unique: jb_c8dP1OpuXw5gDS0xjOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37BCD3C0F683;
	Thu, 27 Oct 2022 08:36:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65350200C0DA;
	Thu, 27 Oct 2022 08:36:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C59D194706C;
	Thu, 27 Oct 2022 08:36:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 493D41946597 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 08:36:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C94E40C83EB; Thu, 27 Oct 2022 08:36:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 247FD40C83DD
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D83A101CC62
 for <linux-cachefs@redhat.com>; Thu, 27 Oct 2022 08:36:03 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-160-MgFVxBJ3Oq2jIoKTFEbLUQ-1; Thu, 27 Oct 2022 04:35:51 -0400
X-MC-Unique: MgFVxBJ3Oq2jIoKTFEbLUQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VTAl7YM_1666859747
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VTAl7YM_1666859747) by smtp.aliyun-inc.com;
 Thu, 27 Oct 2022 16:35:48 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Date: Thu, 27 Oct 2022 16:35:38 +0800
Message-Id: <20221027083547.46933-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH 0/9] fscache,
 netfs: decouple raw fscache APIs from libnetfs
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
Cc: linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Git tree:

    https://github.com/lostjeffle/linux.git jingbo/clean-fscache-v1-clean-netfs

Gitweb:

    https://github.com/lostjeffle/linux/commits/jingbo/clean-fscache-v1-clean-netfs


[Rationale]
===========
Fscache has been landed as a generic caching management framework in
the Linux kernel for decades.  It aims to manage cache data availability
or fetch data if needed.  Currently it's mainly used for network fses,
but in principle the main caching subsystem can be used more widely.

We do really like fscache framework and we believe it'd be better to
reuse such framework if possible instead of duplicating other
alternatives for better maintenance and testing.  Therefore for our
container image use cases, we applied the existing fscache to implement
on-demand read for erofs in the past months.  For more details, also see
[1].

In short, here each erofs filesystem is composed of multiple blobs (or
devices).  Each blob corresponds to one fscache cookie to strictly
follow on-disk format and implement the image downloading in a
deterministic manner, which means it has a unique checksum and is signed
by vendors.

Data of each erofs inode can be scattered among multiple blobs (cookie)
since erofs supports chunk-level deduplication.  In this case, each
erofs inode can correspond to multiple cookies, and there's a logical to
physical offset mapping between the logical offset in erofs inode and
the physical offset in the backing file.

As described above, per-cookie netfs model can not be used here
directly.  Instead, we'd like to propose/decouple a simple set of raw
fscache APIs, e.g. fscache_read(), to access cache for all fses to use.
We believe it's useful since it's like the relationship between raw bio
and iomap, both of which are useful for local fses.  However, after
fscache/netfs rework, libnetfs is preferred to access fscache, making
fscache closely coupled with libnetfs.

Therefore, a more simple neutral raw fscache APIs is shown here which is
independent to libnetfs for those who are not using libnetfs.


[Patchset Organization]
=======================
patch 1: decouple prepare_read() from netfs_io_subrequest

patch 2-9:
All structures related to cache accessing will be transformed with
"fscache_" prefix, and defined in fscache namespace.  The whole
transition is divided into separate patches to facilitate code review,
with each patch transforming one structure.

It is worth noting that the structure declaration is temporarily placed
in netfs.h, and will be moved to fscache.h when all related structures
are transformed to "fscache_" prefixed finally.  The reason is that, in
the intermediate state during the transition, the declarations of
related structures are scattered among fscache.h and netfs.h.  This will
cause a bidirectional reference of these two headers, and compilation
error then.  As a work around, keep the declaration in netfs.h
temporarily, until all structures are transformed and then moved to
fscache.h (in patch 9).


[Following cleanup for erofs]
=============================
We will also cleanup erofs based on fscache_read() so that it won't rely
on netfs internals anymore. For example, erofs can implement its own
request completion routine, so that it can get rid of reliance on
netfs_io_request and netfs_io_subrequest.


[1] https://lore.kernel.org/all/Yoj1AcHoBPqir++H@debian/


Jingbo Xu (9):
  fscache: decouple prepare_read() from netfs_io_subrequest
  fscache,netfs: rename netfs_io_source as fscache_io_source
  fscache,netfs: rename netfs_io_terminated_t as fscache_io_terminated_t
  fscache,netfs: rename netfs_read_from_hole as fscache_read_from_hole
  fscache,netfs: rename netfs_cache_ops as fscache_ops
  fscache,netfs: rename netfs_cache_resources as fscache_resources
  fscache,netfs: define flags for prepare_read()
  fscache,netfs: move PageFsCache() family helpers to fscache.h
  fscache,netfs: move "fscache_" prefixed structures to fscache.h

 fs/afs/internal.h                 |   2 +-
 fs/cachefiles/interface.c         |   2 +-
 fs/cachefiles/internal.h          |   8 +-
 fs/cachefiles/io.c                |  84 ++++++------
 fs/cifs/fscache.c                 |   8 +-
 fs/erofs/fscache.c                |  17 ++-
 fs/fscache/io.c                   |  18 +--
 fs/netfs/buffered_read.c          |   2 +-
 fs/netfs/io.c                     |  67 +++++-----
 fs/nfs/fscache.c                  |   6 +-
 fs/nfs/fscache.h                  |   2 +-
 include/linux/fscache-cache.h     |   8 +-
 include/linux/fscache.h           | 211 +++++++++++++++++++++++++++---
 include/linux/netfs.h             | 173 +-----------------------
 include/trace/events/cachefiles.h |  27 ++--
 include/trace/events/netfs.h      |  14 +-
 16 files changed, 330 insertions(+), 319 deletions(-)

-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

