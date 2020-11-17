Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C3C1E2BAF1A
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605886753;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4c4Ax1leAh+W8EKmjBzScQiJfh0LStVuKG4dCEmW/Pc=;
	b=T9/v2l3q2WR0iDTFDjOF6UqbN1u9eaHOZmcrq2C6Cw//yLlT0mlmi9b9bVY30zHJN5/DiZ
	LUD+e0e2ZZyO5RZAg2oXTPRdQ/4bDwDV51r94vyISwHkTWxUij8UPwEBONyXPg+uP59cDw
	MXWDS9bSuYNuxb3E4aieT6dVtEV95SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-DfSLa_ZWMEOvmST8lx-Dcw-1; Fri, 20 Nov 2020 10:39:11 -0500
X-MC-Unique: DfSLa_ZWMEOvmST8lx-Dcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC512100C63A;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAC17F6F5;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B675B1809CA2;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AH3IHSL002022 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 22:18:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0CB792166BA2; Tue, 17 Nov 2020 03:18:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 078302166BA0
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:18:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37271858289
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:18:15 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-330-awN7L9CYMiuSaZ0EtP39qA-1;
	Mon, 16 Nov 2020 22:18:09 -0500
X-MC-Unique: awN7L9CYMiuSaZ0EtP39qA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 911401C21; Mon, 16 Nov 2020 22:18:08 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 911401C21
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Mon, 16 Nov 2020 22:18:03 -0500
Message-Id: <1605583086-19869-1-git-send-email-bfields@redhat.com>
In-Reply-To: <20201117031601.GB10526@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 20 Nov 2020 10:39:06 -0500
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 1/4] nfsd: move fill_{pre,
	post}_wcc to nfsfh.c
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "J. Bruce Fields" <bfields@redhat.com>

These functions are actually used by NFSv4 code as well, and having them
in nfs3xdr.c has caused some confusion.

This is just cleanup, no change in behavior.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfsd/nfs3xdr.c | 49 -----------------------------------------------
 fs/nfsd/nfsfh.c   | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/fs/nfsd/nfs3xdr.c b/fs/nfsd/nfs3xdr.c
index 2277f83da250..14efb3aba6b2 100644
--- a/fs/nfsd/nfs3xdr.c
+++ b/fs/nfsd/nfs3xdr.c
@@ -252,55 +252,6 @@ encode_wcc_data(struct svc_rqst *rqstp, __be32 *p, struct svc_fh *fhp)
 	return encode_post_op_attr(rqstp, p, fhp);
 }
 
-/*
- * Fill in the pre_op attr for the wcc data
- */
-void fill_pre_wcc(struct svc_fh *fhp)
-{
-	struct inode    *inode;
-	struct kstat	stat;
-	__be32 err;
-
-	if (fhp->fh_pre_saved)
-		return;
-
-	inode = d_inode(fhp->fh_dentry);
-	err = fh_getattr(fhp, &stat);
-	if (err) {
-		/* Grab the times from inode anyway */
-		stat.mtime = inode->i_mtime;
-		stat.ctime = inode->i_ctime;
-		stat.size  = inode->i_size;
-	}
-
-	fhp->fh_pre_mtime = stat.mtime;
-	fhp->fh_pre_ctime = stat.ctime;
-	fhp->fh_pre_size  = stat.size;
-	fhp->fh_pre_change = nfsd4_change_attribute(&stat, inode);
-	fhp->fh_pre_saved = true;
-}
-
-/*
- * Fill in the post_op attr for the wcc data
- */
-void fill_post_wcc(struct svc_fh *fhp)
-{
-	__be32 err;
-
-	if (fhp->fh_post_saved)
-		printk("nfsd: inode locked twice during operation.\n");
-
-	err = fh_getattr(fhp, &fhp->fh_post_attr);
-	fhp->fh_post_change = nfsd4_change_attribute(&fhp->fh_post_attr,
-						     d_inode(fhp->fh_dentry));
-	if (err) {
-		fhp->fh_post_saved = false;
-		/* Grab the ctime anyway - set_change_info might use it */
-		fhp->fh_post_attr.ctime = d_inode(fhp->fh_dentry)->i_ctime;
-	} else
-		fhp->fh_post_saved = true;
-}
-
 /*
  * XDR decode functions
  */
diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
index c81dbbad8792..b3b4e8809aa9 100644
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -711,3 +711,52 @@ enum fsid_source fsid_source(struct svc_fh *fhp)
 		return FSIDSOURCE_UUID;
 	return FSIDSOURCE_DEV;
 }
+
+/*
+ * Fill in the pre_op attr for the wcc data
+ */
+void fill_pre_wcc(struct svc_fh *fhp)
+{
+	struct inode    *inode;
+	struct kstat	stat;
+	__be32 err;
+
+	if (fhp->fh_pre_saved)
+		return;
+
+	inode = d_inode(fhp->fh_dentry);
+	err = fh_getattr(fhp, &stat);
+	if (err) {
+		/* Grab the times from inode anyway */
+		stat.mtime = inode->i_mtime;
+		stat.ctime = inode->i_ctime;
+		stat.size  = inode->i_size;
+	}
+
+	fhp->fh_pre_mtime = stat.mtime;
+	fhp->fh_pre_ctime = stat.ctime;
+	fhp->fh_pre_size  = stat.size;
+	fhp->fh_pre_change = nfsd4_change_attribute(&stat, inode);
+	fhp->fh_pre_saved = true;
+}
+
+/*
+ * Fill in the post_op attr for the wcc data
+ */
+void fill_post_wcc(struct svc_fh *fhp)
+{
+	__be32 err;
+
+	if (fhp->fh_post_saved)
+		printk("nfsd: inode locked twice during operation.\n");
+
+	err = fh_getattr(fhp, &fhp->fh_post_attr);
+	fhp->fh_post_change = nfsd4_change_attribute(&fhp->fh_post_attr,
+						     d_inode(fhp->fh_dentry));
+	if (err) {
+		fhp->fh_post_saved = false;
+		/* Grab the ctime anyway - set_change_info might use it */
+		fhp->fh_post_attr.ctime = d_inode(fhp->fh_dentry)->i_ctime;
+	} else
+		fhp->fh_post_saved = true;
+}
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

