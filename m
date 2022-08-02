Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 799BA5875BF
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+8Lmhu8NE7oC9yFOLwlBJevup3hUwFlJbp8sbmogzkg=;
	b=EwN3IrRAbZhMC7vrv5IY/Gltm39qmh9iYR+d25HYa32mBtBAD/MtVde4Lm4xc6e6e8l0EY
	hrObRaACl0Y8R4RjO21TXvDx/FZXFQT2x7kswMWEtZhVT+gvNVVPdC5oPTat3qyCo3Th4T
	IVgKxBRsX7NoEVwFrQhmoltza8pEmPQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-LdvDCnxZMd-TaGqIT0rCuQ-1; Mon, 01 Aug 2022 23:03:56 -0400
X-MC-Unique: LdvDCnxZMd-TaGqIT0rCuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE925803301;
	Tue,  2 Aug 2022 03:03:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C51DAC1D3AD;
	Tue,  2 Aug 2022 03:03:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B53971946A50;
	Tue,  2 Aug 2022 03:03:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9D2CA1946A56 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8D07E40CF8ED; Tue,  2 Aug 2022 03:03:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892A0400DEF8
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE9D5101A586
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:53 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-wF1qdqGMM4G7CQ3kghAehA-1; Mon, 01 Aug 2022 23:03:49 -0400
X-MC-Unique: wF1qdqGMM4G7CQ3kghAehA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9W-MZ_1659409424
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9W-MZ_1659409424) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:45 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:36 +0800
Message-Id: <20220802030342.46302-4-jefflexu@linux.alibaba.com>
In-Reply-To: <20220802030342.46302-1-jefflexu@linux.alibaba.com>
References: <20220802030342.46302-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH RFC 3/9] cachefiles: allocate per-subdir
 content map files
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allocate one content map file for each sub-directory under one volume,
so that the cacehfilesd only needs to remove the whole sub-directory
(including the content map file and backing files in the sub-directory)
as usual when it's going to cull the whole sub-directory or volume.

The content map file will be shared among all backing files under this
same sub-directory.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h |  1 +
 fs/cachefiles/namei.c    |  2 +-
 fs/cachefiles/volume.c   | 14 ++++++++++++--
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 4c3ee6935811..06bde4e0e4f5 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -42,6 +42,7 @@ struct cachefiles_volume {
 	struct fscache_volume		*vcookie;	/* The netfs's representation */
 	struct dentry			*dentry;	/* The volume dentry */
 	struct dentry			*fanout[256];	/* Fanout subdirs */
+	struct file                     *content_map[256]; /* Content map files */
 };
 
 /*
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index 2948eea18ca2..d2d5feea64e8 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -292,7 +292,7 @@ int cachefiles_look_up_map(struct cachefiles_cache *cache,
 
 	path.mnt = cache->mnt;
 	path.dentry = dentry;
-	file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE,
+	file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE | O_DSYNC,
 			d_backing_inode(dentry), cache->cache_cred);
 	if (IS_ERR(file))
 		cachefiles_put_directory(dentry);
diff --git a/fs/cachefiles/volume.c b/fs/cachefiles/volume.c
index 89df0ba8ba5e..4decc91a8886 100644
--- a/fs/cachefiles/volume.c
+++ b/fs/cachefiles/volume.c
@@ -20,6 +20,7 @@ void cachefiles_acquire_volume(struct fscache_volume *vcookie)
 	struct cachefiles_cache *cache = vcookie->cache->cache_priv;
 	const struct cred *saved_cred;
 	struct dentry *vdentry, *fan;
+	struct file *map;
 	size_t len;
 	char *name;
 	bool is_new = false;
@@ -73,6 +74,11 @@ void cachefiles_acquire_volume(struct fscache_volume *vcookie)
 		if (IS_ERR(fan))
 			goto error_fan;
 		volume->fanout[i] = fan;
+
+		ret = cachefiles_look_up_map(cache, fan, &map);
+		if (ret)
+			goto error_fan;
+		volume->content_map[i] = map;
 	}
 
 	cachefiles_end_secure(cache, saved_cred);
@@ -91,8 +97,10 @@ void cachefiles_acquire_volume(struct fscache_volume *vcookie)
 	return;
 
 error_fan:
-	for (i = 0; i < 256; i++)
+	for (i = 0; i < 256; i++) {
 		cachefiles_put_directory(volume->fanout[i]);
+		cachefiles_put_map(volume->content_map[i]);
+	}
 error_dir:
 	cachefiles_put_directory(volume->dentry);
 error_name:
@@ -113,8 +121,10 @@ static void __cachefiles_free_volume(struct cachefiles_volume *volume)
 
 	volume->vcookie->cache_priv = NULL;
 
-	for (i = 0; i < 256; i++)
+	for (i = 0; i < 256; i++) {
 		cachefiles_put_directory(volume->fanout[i]);
+		cachefiles_put_map(volume->content_map[i]);
+	}
 	cachefiles_put_directory(volume->dentry);
 	kfree(volume);
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

