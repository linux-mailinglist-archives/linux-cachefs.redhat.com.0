Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC1C2BB922
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605911978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wciMNPoW1F5TdE5RpNW0qkiftCprSMvyboXudI3DNg0=;
	b=LaXQRi/ZTvRmApHNgg8znpNX7T3Z5oiKdKtHeDEzp72p1FxJSgvuxfbvUJ1VgvIiB2VVQn
	bS85FbDzXWNvzF7tlz+9mrxhbIRuVdIFy0vVCRRGeUcwftaisXo8oGxO5C2gK53bIRiuZi
	qxmTvUOkggl0gV+jg5ZklDYWaWuNQkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-qaeOP0aANPaX3M0OJIGOCw-1; Fri, 20 Nov 2020 17:39:36 -0500
X-MC-Unique: qaeOP0aANPaX3M0OJIGOCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFAB88797DA;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFDBB163C8;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A97B81809C9F;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMdUIA019127 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:39:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AB23F1000DBD; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A747D115D354
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD17811E76
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-564-YzIe4RVJOMiH2Bj2xnkPFg-1;
	Fri, 20 Nov 2020 17:39:24 -0500
X-MC-Unique: YzIe4RVJOMiH2Bj2xnkPFg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 6D67E6E9F; Fri, 20 Nov 2020 17:39:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 6D67E6E9F
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Nov 2020 17:39:16 -0500
Message-Id: <1605911960-12516-4-git-send-email-bfields@redhat.com>
In-Reply-To: <1605911960-12516-1-git-send-email-bfields@redhat.com>
References: <20201120223831.GB7705@fieldses.org>
	<1605911960-12516-1-git-send-email-bfields@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 4/8] nfsd4: don't query change attribute in
	v2/v3 case
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

inode_query_iversion() has side effects, and there's no point calling it
when we're not even going to use it.

We check whether we're currently processing a v4 request by checking
fh_maxsize, which is arguably a little hacky; we could add a flag to
svc_fh instead.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfsd/nfs3xdr.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/nfsd/nfs3xdr.c b/fs/nfsd/nfs3xdr.c
index 2277f83da250..2732b04d3878 100644
--- a/fs/nfsd/nfs3xdr.c
+++ b/fs/nfsd/nfs3xdr.c
@@ -259,11 +259,11 @@ void fill_pre_wcc(struct svc_fh *fhp)
 {
 	struct inode    *inode;
 	struct kstat	stat;
+	bool v4 = (fhp->fh_maxsize == NFS4_FHSIZE);
 	__be32 err;
 
 	if (fhp->fh_pre_saved)
 		return;
-
 	inode = d_inode(fhp->fh_dentry);
 	err = fh_getattr(fhp, &stat);
 	if (err) {
@@ -272,11 +272,12 @@ void fill_pre_wcc(struct svc_fh *fhp)
 		stat.ctime = inode->i_ctime;
 		stat.size  = inode->i_size;
 	}
+	if (v4)
+		fhp->fh_pre_change = nfsd4_change_attribute(&stat, inode);
 
 	fhp->fh_pre_mtime = stat.mtime;
 	fhp->fh_pre_ctime = stat.ctime;
 	fhp->fh_pre_size  = stat.size;
-	fhp->fh_pre_change = nfsd4_change_attribute(&stat, inode);
 	fhp->fh_pre_saved = true;
 }
 
@@ -285,18 +286,21 @@ void fill_pre_wcc(struct svc_fh *fhp)
  */
 void fill_post_wcc(struct svc_fh *fhp)
 {
+	bool v4 = (fhp->fh_maxsize == NFS4_FHSIZE);
+	struct inode *inode = d_inode(fhp->fh_dentry);
 	__be32 err;
 
 	if (fhp->fh_post_saved)
 		printk("nfsd: inode locked twice during operation.\n");
 
 	err = fh_getattr(fhp, &fhp->fh_post_attr);
-	fhp->fh_post_change = nfsd4_change_attribute(&fhp->fh_post_attr,
-						     d_inode(fhp->fh_dentry));
+	if (v4)
+		fhp->fh_post_change =
+			nfsd4_change_attribute(&fhp->fh_post_attr, inode);
 	if (err) {
 		fhp->fh_post_saved = false;
 		/* Grab the ctime anyway - set_change_info might use it */
-		fhp->fh_post_attr.ctime = d_inode(fhp->fh_dentry)->i_ctime;
+		fhp->fh_post_attr.ctime = inode->i_ctime;
 	} else
 		fhp->fh_post_saved = true;
 }
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

