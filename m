Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB346FBE7
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 08:38:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-0WhW47djPBq_ojmI9K3ikQ-1; Fri, 10 Dec 2021 02:38:33 -0500
X-MC-Unique: 0WhW47djPBq_ojmI9K3ikQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EAC281CCB6;
	Fri, 10 Dec 2021 07:38:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A445560C04;
	Fri, 10 Dec 2021 07:38:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 685F81809CBA;
	Fri, 10 Dec 2021 07:38:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BA7aUxV027776 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 02:36:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3780C4010FDD; Fri, 10 Dec 2021 07:36:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3297740CFD0A
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B42B2B7604D
	for <linux-cachefs@redhat.com>; Fri, 10 Dec 2021 07:36:30 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-106-tmJ0mfvbPEiPisxWETqUkw-1; Fri, 10 Dec 2021 02:36:28 -0500
X-MC-Unique: tmJ0mfvbPEiPisxWETqUkw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V-8PLOr_1639121783
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V-8PLOr_1639121783) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 10 Dec 2021 15:36:24 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Fri, 10 Dec 2021 15:36:03 +0800
Message-Id: <20211210073619.21667-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
References: <20211210073619.21667-1-jefflexu@linux.alibaba.com>
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
Subject: [Linux-cachefs] [RFC 03/19] cachefiles: refactor
	cachefiles_adjust_size()
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

In demand-read mode, fs using fscache for demand-read doesn't know the
exact file size of the data blob file, and the input @object_size
parameter of fscache_acquire_cookie() could be fake in this case.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/interface.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index 51c968cd00a6..b85051250cb7 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -110,6 +110,7 @@ static int cachefiles_adjust_size(struct cachefiles_object *object)
 {
 	struct iattr newattrs;
 	struct file *file = object->file;
+	struct cachefiles_cache *cache = object->volume->cache;
 	uint64_t ni_size;
 	loff_t oi_size;
 	int ret;
@@ -123,6 +124,9 @@ static int cachefiles_adjust_size(struct cachefiles_object *object)
 	if (!file)
 		return -ENOBUFS;
 
+	if (cache->mode == CACHEFILES_MODE_DEMAND)
+		return 0;
+
 	oi_size = i_size_read(file_inode(file));
 	if (oi_size == ni_size)
 		return 0;
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

