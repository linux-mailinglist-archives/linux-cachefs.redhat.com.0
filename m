Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D605875BB
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xKY7gkFEdHXY/qzk8LbTs0z1ecDTNZu44JCvVa8zTkI=;
	b=grhfQJX13sC7AVkLsaM+6/wSbmFTLqsw7a7mEgDCn/aDjVB5Wtbe9+dJIUMsgM/gsyqqMK
	XhMFtj5aRq9cCfyrFhQLLn5bQ6TPs47ASi3gZWciARSXymrZNHeARmKSnyHNWxumNr0GXA
	XWlZndZJTsH7/34VbidIMYiZ/89SdbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-wYOhyVQLMzu9zLOILCnreA-1; Mon, 01 Aug 2022 23:03:55 -0400
X-MC-Unique: wYOhyVQLMzu9zLOILCnreA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E21B88032F1;
	Tue,  2 Aug 2022 03:03:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A637A141510F;
	Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F8B41946A52;
	Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 885F21946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69B7DC1D3AD; Tue,  2 Aug 2022 03:03:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E00C15D4F
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EC67185A794
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:51 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-74r2Gi3vMxanafz-sMV4hw-1; Mon, 01 Aug 2022 23:03:46 -0400
X-MC-Unique: 74r2Gi3vMxanafz-sMV4hw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9W-L4_1659409422
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9W-L4_1659409422) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:42 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:33 +0800
Message-Id: <20220802030342.46302-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [RFC PATCH 0/9] cachefiles: content map
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
Cc: xiang@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Kernel Patchset
===============
Git tree:

    https://github.com/lostjeffle/linux.git jingbo/dev-fscache-bitmap-v1

Gitweb:

    https://github.com/lostjeffle/linux/commits/jingbo/dev-fscache-bitmap-v1


[Introduction]
==============

Besides the SEEK_[DATA|HOLE] llseek mechanism provided by the backing
filesystem, this patch set is going to introduce a bitmap based
mechanism, in which a self-maintained bitmap is used to track if the
file range has been cached by the backing file.


[Design]
========

[Content Map]
The content map is allocated/expanded/shorten in unit of PAGE_SIZE,
which is multiples times of the block size of the backing filesystem,
so that the backing content map file can be easily punched hole if the
content map gets truncated or invalidated. Each bit of the content map
indicates the existence of 4KB data of the backing file, thus each
(4K sized) chunk of content map covers 128MB data of the backing file.

In the lookup phase, for the case when the backing file already exists,
the content map is loaded from the backing content map file. When the
backing file gets written, the content map gets updated on the
completion of the write (i.e. cachefiles_write_complete()).

When the backing file is truncated to a larger size, we need to expand
the content map accordingly. However the expansion of the content map is
done in a lazy expansion way. That is, the expansion of the content map
is delayed to the point when the content map needs to be marked, inside
cachefiles_write_complete(), i.e. iocb.ki_complete() callback. It shall
be safe to allocate memory with GFP_KERNEL inside the iocb.ki_complete()
callback, since the callback is scheduled by workqueue for DIRECT IO.

While for the case where the backing file doesn't exist, i.e. a new
tmpfile is created as the backing file, the content map will not be
allocated at the lookup phase. Instead, it will be expanded at runtime
in the same way described above.

When the backing file is truncated to a smaller size, only the tailing
part that exceeds the new size gets zeroed, while the content map itself
is not truncated.

Thus the content map size may be smaller or larger than the actual size
of the backing file.


[Backing Content Map File]
The content map is permanentized to the backing content map file.
Currently each sub-directory under one volume maintains one backing
content map file, so that the cacehfilesd only needs to remove the whole
sub-directory (including the content map file and backing files in the
sub-directory) as usual when it's going to cull the whole sub-directory
or volume.

In this case, the content map file will be shared among all backing
files under the same sub-directory. Thus the offset of the content map
in the backing content map file needs to be stored in the xattr for each
backing file. Besides, since the content map size may be smaller or
larger than the actual size of the backing file as we described above,
the content map size also needs to be stored in the xattr of the backing
file.

When expanding the content map, a new offset inside the backing content
map file also needs to be allocated, with the old range starting from
the old offset getting punched hole. Currently the new offset is always
allocated in an appending style, i.e. the previous hole will not be
reused.


[Time Sequence]
===============
I haven't do much work on this yet though... Actually there are three
actions when filling the cache:

1. write data to the backing file
2. write content map to the backing content map file
3. flush the content of xattr to disk

Currently action 1 is through DIRECT IO, while action 2 is buffered IO.
To make sure the content map is flushed to disk _before_ xattr gets
flushed to disk, the backing content map file is opened with O_DSYNC, so
that the following write to the backing content map file will only
return when the written data has been flushed to disk.


[TEST]
======
It passes the test cases for on-demand mode[1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/tests/fscache?h=experimental-tests-fscache

It also passes xfstests on NFS 4.0 with fscache enabled.

The performance test is still under progress.


Jingbo Xu (9):
  cachefiles: improve FSCACHE_COOKIE_NO_DATA_TO_READ optimization
  cachefiles: add content map file helpers
  cachefiles: allocate per-subdir content map files
  cachefiles: alloc/load/save content map
  cachefiles: mark content map on write to the backing file
  cachefiles: check content map on read/write
  cachefiles: free content map on invalidate
  cachefiles: resize content map on resize
  cachefiles: cull content map file on cull

 fs/cachefiles/Makefile      |   3 +-
 fs/cachefiles/content-map.c | 333 ++++++++++++++++++++++++++++++++++++
 fs/cachefiles/interface.c   |  10 +-
 fs/cachefiles/internal.h    |  31 ++++
 fs/cachefiles/io.c          |  59 +++++--
 fs/cachefiles/namei.c       |  96 +++++++++++
 fs/cachefiles/ondemand.c    |   5 +-
 fs/cachefiles/volume.c      |  14 +-
 fs/cachefiles/xattr.c       |  26 +++
 fs/fscache/cookie.c         |   2 +-
 10 files changed, 558 insertions(+), 21 deletions(-)
 create mode 100644 fs/cachefiles/content-map.c

-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

