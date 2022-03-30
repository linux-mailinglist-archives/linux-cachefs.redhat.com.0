Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3FB4EBE0B
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Mar 2022 11:48:53 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-w3l7XH8aPhiBmO5avvTATA-1; Wed, 30 Mar 2022 05:48:49 -0400
X-MC-Unique: w3l7XH8aPhiBmO5avvTATA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E05A038035BB;
	Wed, 30 Mar 2022 09:48:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 810DE40CF917;
	Wed, 30 Mar 2022 09:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 93E77194034B;
	Wed, 30 Mar 2022 09:48:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6F0F819466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Mar 2022 09:48:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4B464400E54F; Wed, 30 Mar 2022 09:48:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4725140CF917
 for <linux-cachefs@redhat.com>; Wed, 30 Mar 2022 09:48:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 102CC1C05ADB
 for <linux-cachefs@redhat.com>; Wed, 30 Mar 2022 09:48:19 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-vhylCIrbNfuHFZfVia3jiw-1; Wed, 30 Mar 2022 05:48:04 -0400
X-MC-Unique: vhylCIrbNfuHFZfVia3jiw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V8djsoq_1648633679
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8djsoq_1648633679) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 30 Mar 2022 17:48:00 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Wed, 30 Mar 2022 17:47:59 +0800
Message-Id: <20220330094759.69406-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v2] cachefiles: unmark inode in use in error
 path
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unmark inode in use if error encountered. If the in-use flag leakage
occurs in cachefiles_open_file(), Cachefiles will complain "Inode
already in use" when later another cookie with the same index key is
looked up.

If the in-use flag leakage occurs in cachefiles_create_tmpfile(), though
the "Inode already in use" warning won't be triggered, fix the leakage
anyway.

Reported-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Fixes: 1f08c925e7a3 ("cachefiles: Implement backing file wrangling")
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
changes since v1:
- update commit message
- keep check_failed label there
---
 fs/cachefiles/namei.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index f256c8aff7bb..fe1bab0f36d4 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -57,6 +57,16 @@ static void __cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
 	trace_cachefiles_mark_inactive(object, inode);
 }
 
+static void cachefiles_do_unmark_inode_in_use(struct cachefiles_object *object,
+				       struct dentry *dentry)
+{
+	struct inode *inode = d_backing_inode(dentry);
+
+	inode_lock(inode);
+	__cachefiles_unmark_inode_in_use(object, dentry);
+	inode_unlock(inode);
+}
+
 /*
  * Unmark a backing inode and tell cachefilesd that there's something that can
  * be culled.
@@ -68,9 +78,7 @@ void cachefiles_unmark_inode_in_use(struct cachefiles_object *object,
 	struct inode *inode = file_inode(file);
 
 	if (inode) {
-		inode_lock(inode);
-		__cachefiles_unmark_inode_in_use(object, file->f_path.dentry);
-		inode_unlock(inode);
+		cachefiles_do_unmark_inode_in_use(object, file->f_path.dentry);
 
 		if (!test_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags)) {
 			atomic_long_add(inode->i_blocks, &cache->b_released);
@@ -484,7 +492,7 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
 				object, d_backing_inode(path.dentry), ret,
 				cachefiles_trace_trunc_error);
 			file = ERR_PTR(ret);
-			goto out_dput;
+			goto out_unuse;
 		}
 	}
 
@@ -494,15 +502,20 @@ struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
 		trace_cachefiles_vfs_error(object, d_backing_inode(path.dentry),
 					   PTR_ERR(file),
 					   cachefiles_trace_open_error);
-		goto out_dput;
+		goto out_unuse;
 	}
 	if (unlikely(!file->f_op->read_iter) ||
 	    unlikely(!file->f_op->write_iter)) {
 		fput(file);
 		pr_notice("Cache does not support read_iter and write_iter\n");
 		file = ERR_PTR(-EINVAL);
+		goto out_unuse;
 	}
 
+	goto out_dput;
+
+out_unuse:
+	cachefiles_do_unmark_inode_in_use(object, path.dentry);
 out_dput:
 	dput(path.dentry);
 out:
@@ -590,14 +603,16 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
 check_failed:
 	fscache_cookie_lookup_negative(object->cookie);
 	cachefiles_unmark_inode_in_use(object, file);
-	if (ret == -ESTALE) {
-		fput(file);
-		dput(dentry);
+	fput(file);
+	dput(dentry);
+	if (ret == -ESTALE)
 		return cachefiles_create_file(object);
-	}
+	return false;
+
 error_fput:
 	fput(file);
 error:
+	cachefiles_do_unmark_inode_in_use(object, dentry);
 	dput(dentry);
 	return false;
 }
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

