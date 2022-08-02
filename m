Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4F5875BC
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Aug 2022 05:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659409438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JjsfjrkFR6tUoMgp/9atWgUbATUg0CTBZagr5HLwSFk=;
	b=MaKbqQ6qd8/fMQ7wOv5rElVL5a7IrdZUwCDXcwA7Pf+Sad84MRUrlFmErBnDLilBWj4htu
	t2g48cGU46wythtyHqXh85hYWi6QnZDCB0ZGzEnU01e3d+y4oJ5J0Fj9P40DQBAvnWbADr
	09rsJyC/3c053ZBP/Ypnv/W3rF3IPSQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-6mMfKDHVMO6JyN1_mWSrtA-1; Mon, 01 Aug 2022 23:03:55 -0400
X-MC-Unique: 6mMfKDHVMO6JyN1_mWSrtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1AE3294EDCE;
	Tue,  2 Aug 2022 03:03:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F8ED4050C46;
	Tue,  2 Aug 2022 03:03:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 857361946A4E;
	Tue,  2 Aug 2022 03:03:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1507F1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 03:03:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 089442166B2A; Tue,  2 Aug 2022 03:03:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04BBE2166B26
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC7E638149A5
 for <linux-cachefs@redhat.com>; Tue,  2 Aug 2022 03:03:52 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-0CDXF_A2PWSc8CugOWacTA-1; Mon, 01 Aug 2022 23:03:49 -0400
X-MC-Unique: 0CDXF_A2PWSc8CugOWacTA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VL9XpKv_1659409424
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VL9XpKv_1659409424) by smtp.aliyun-inc.com;
 Tue, 02 Aug 2022 11:03:44 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue,  2 Aug 2022 11:03:35 +0800
Message-Id: <20220802030342.46302-3-jefflexu@linux.alibaba.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Linux-cachefs] [PATCH RFC 2/9] cachefiles: add content map file
 helpers
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Besides the mapping mechanism provided by the backing fs, a self
maintained bitmap can be used to track if the corresponding file range
is cached by the backing file or not. In this case, a content map file
is used to permanentize the bitmap.

As the first step, add the helper functions for looking up and freeing
these content map files.

Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
---
 fs/cachefiles/internal.h |  4 ++
 fs/cachefiles/namei.c    | 88 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 6cba2c6de2f9..4c3ee6935811 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -270,6 +270,10 @@ extern struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 					       bool *_is_new);
 extern void cachefiles_put_directory(struct dentry *dir);
 
+int cachefiles_look_up_map(struct cachefiles_cache *cache,
+			   struct dentry *dir, struct file **pfile);
+void cachefiles_put_map(struct file *file);
+
 extern int cachefiles_cull(struct cachefiles_cache *cache, struct dentry *dir,
 			   char *filename);
 
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index facf2ebe464b..2948eea18ca2 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -231,6 +231,94 @@ void cachefiles_put_directory(struct dentry *dir)
 	}
 }
 
+/*
+ * Look up a content map file.
+ */
+int cachefiles_look_up_map(struct cachefiles_cache *cache,
+			   struct dentry *dir, struct file **pfile)
+{
+	struct dentry *dentry;
+	struct file *file;
+	struct path path;
+	char *name = "Map";
+	int ret;
+
+	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
+retry:
+	ret = cachefiles_inject_read_error();
+	if (ret)
+		goto err_unlock_dir;
+
+	dentry = lookup_one_len(name, dir, strlen(name));
+	if (IS_ERR(dentry)) {
+		ret = PTR_ERR(dentry);
+		goto err_unlock_dir;
+	}
+
+	if (d_is_negative(dentry)) {
+		ret = cachefiles_has_space(cache, 1, 0,
+				cachefiles_has_space_for_create);
+		if (ret)
+			goto err_dput;
+
+		ret = vfs_create(&init_user_ns, d_inode(dir), dentry, S_IFREG, true);
+		if (ret)
+			goto err_dput;
+
+		if (unlikely(d_unhashed(dentry))) {
+			cachefiles_put_directory(dentry);
+			goto retry;
+		}
+		ASSERT(d_backing_inode(dentry));
+	}
+
+	inode_lock(d_inode(dentry));
+	inode_unlock(d_inode(dir));
+
+	if (!__cachefiles_mark_inode_in_use(NULL, dentry)) {
+		inode_unlock(d_inode(dentry));
+		dput(dentry);
+		return -EBUSY;
+	}
+
+	inode_unlock(d_inode(dentry));
+	ASSERT(d_backing_inode(dentry));
+
+	if (!d_is_reg(dentry)) {
+		pr_err("%pd is not a file\n", dentry);
+		cachefiles_put_directory(dentry);
+		return -EIO;
+	}
+
+	path.mnt = cache->mnt;
+	path.dentry = dentry;
+	file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE,
+			d_backing_inode(dentry), cache->cache_cred);
+	if (IS_ERR(file))
+		cachefiles_put_directory(dentry);
+
+	*pfile = file;
+	dput(dentry);
+	return 0;
+
+err_dput:
+	dput(dentry);
+err_unlock_dir:
+	inode_unlock(d_inode(dir));
+	return ret;
+}
+
+/*
+ * Put a content map file.
+ */
+void cachefiles_put_map(struct file *file)
+{
+	if (file) {
+		cachefiles_do_unmark_inode_in_use(NULL, file->f_path.dentry);
+		fput(file);
+	}
+}
+
 /*
  * Remove a regular file from the cache.
  */
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

