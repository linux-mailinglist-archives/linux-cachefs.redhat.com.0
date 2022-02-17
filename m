Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CBB4B9FAE
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Feb 2022 13:06:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-Xwp-yNZBNIWqFa6shDVFCQ-1; Thu, 17 Feb 2022 07:06:19 -0500
X-MC-Unique: Xwp-yNZBNIWqFa6shDVFCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC43D1091DA4;
	Thu, 17 Feb 2022 12:06:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0CC67B024;
	Thu, 17 Feb 2022 12:06:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 870EA4CA93;
	Thu, 17 Feb 2022 12:06:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HC28Hw026764 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 07:02:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 714A0C202C8; Thu, 17 Feb 2022 12:02:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CE3EC1914B
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 12:02:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53D4F38008B1
	for <linux-cachefs@redhat.com>; Thu, 17 Feb 2022 12:02:08 +0000 (UTC)
Received: from out199-14.us.a.mail.aliyun.com
	(out199-14.us.a.mail.aliyun.com [47.90.199.14]) by relay.mimecast.com
	with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-168-P3htbx2jNb-U5iWNPBb33A-1; Thu, 17 Feb 2022 07:02:06 -0500
X-MC-Unique: P3htbx2jNb-U5iWNPBb33A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R371e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V4kJNJC_1645099314
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V4kJNJC_1645099314) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 17 Feb 2022 20:01:55 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com
Date: Thu, 17 Feb 2022 20:01:50 +0800
Message-Id: <20220217120154.16658-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org, eguan@linux.alibaba.com
Subject: [Linux-cachefs] [RESEND PATCH v3 0/4] fscache,
	erofs: fscache-based demand-read semantics (fscache part)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

This patchset is from [1], which is all fscache part related, in prep
for the newly introduced on-demand read semantics.

The previous patch 5 [2] from [1] is still under modification according
to the comments from Greg. Thus it is not included in this patchset
yet, and will be sent out later.

Whilst these four patches in this patchset are basically trivial cleanup
codes. I do appreciate if you coud give some hint on this work.

Thanks.

[1] https://lore.kernel.org/all/20220215111335.123528-1-jefflexu@linux.alibaba.com/T/
[2] https://lore.kernel.org/all/20220215111335.123528-1-jefflexu@linux.alibaba.com/T/#ma8898ba06bf66d815925a32d1d6689d71346e609



Jeffle Xu (4):
  fscache: export fscache_end_operation()
  fscache: add a method to support on-demand read semantics
  cachefiles: extract generic function for daemon methods
  cachefiles: detect backing file size in on-demand read mode

 Documentation/filesystems/netfs_library.rst | 17 +++++
 fs/cachefiles/Kconfig                       | 13 ++++
 fs/cachefiles/daemon.c                      | 70 +++++++++++++--------
 fs/cachefiles/internal.h                    |  1 +
 fs/cachefiles/namei.c                       | 60 +++++++++++++++++-
 fs/fscache/internal.h                       | 11 ----
 fs/nfs/fscache.c                            |  8 ---
 include/linux/fscache.h                     | 39 ++++++++++++
 include/linux/netfs.h                       |  4 ++
 9 files changed, 178 insertions(+), 45 deletions(-)

-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

