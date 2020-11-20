Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DCFE12BB91D
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605911976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vSlMs2borq7HglQ4Yb93pTJD4yLYBwnVylBaGl5tcjo=;
	b=CYfmqmpraF2+W87P7vJNF8nJcxiBlHC1VPKFbJHhqx1xBPQqvIJ7MPkeSGMi8n09y6rAkQ
	Ti2Ch48stBEOSYyDGsfqgc8uV4A8Si+yHwsoo7iXIdhKH3s3WbTmXtkidDn9WWoFILreCO
	2ewR2xX+OKtzh5VB4CBUGjoPDmSKqFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-ZngSjs6nMV2WBntSFcadiA-1; Fri, 20 Nov 2020 17:39:35 -0500
X-MC-Unique: ZngSjs6nMV2WBntSFcadiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE76C1006C84;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0DC660C15;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC3F91809CA1;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMdUiM019103 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:39:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0CE44F11CA; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07DBAF11D2
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D7685828C
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:27 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-352-vtMY0iGlN4SDx7Vhbh2QFQ-1;
	Fri, 20 Nov 2020 17:39:23 -0500
X-MC-Unique: vtMY0iGlN4SDx7Vhbh2QFQ-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 2422E6E9C; Fri, 20 Nov 2020 17:39:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 2422E6E9C
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Nov 2020 17:39:19 -0500
Message-Id: <1605911960-12516-7-git-send-email-bfields@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 7/8] nfsd: skip some unnecessary stats in
	the v4 case
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "J. Bruce Fields" <bfields@redhat.com>

In the typical case of v4 and a i_version-supporting filesystem, we can
skip a stat which is only required to fake up a change attribute from
ctime.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfsd/nfs3xdr.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/nfsd/nfs3xdr.c b/fs/nfsd/nfs3xdr.c
index 2732b04d3878..8502a493be6d 100644
--- a/fs/nfsd/nfs3xdr.c
+++ b/fs/nfsd/nfs3xdr.c
@@ -265,19 +265,21 @@ void fill_pre_wcc(struct svc_fh *fhp)
 	if (fhp->fh_pre_saved)
 		return;
 	inode = d_inode(fhp->fh_dentry);
-	err = fh_getattr(fhp, &stat);
-	if (err) {
-		/* Grab the times from inode anyway */
-		stat.mtime = inode->i_mtime;
-		stat.ctime = inode->i_ctime;
-		stat.size  = inode->i_size;
+	if (!v4 || !inode->i_sb->s_export_op->fetch_iversion) {
+		err = fh_getattr(fhp, &stat);
+		if (err) {
+			/* Grab the times from inode anyway */
+			stat.mtime = inode->i_mtime;
+			stat.ctime = inode->i_ctime;
+			stat.size  = inode->i_size;
+		}
+		fhp->fh_pre_mtime = stat.mtime;
+		fhp->fh_pre_ctime = stat.ctime;
+		fhp->fh_pre_size  = stat.size;
 	}
 	if (v4)
 		fhp->fh_pre_change = nfsd4_change_attribute(&stat, inode);
 
-	fhp->fh_pre_mtime = stat.mtime;
-	fhp->fh_pre_ctime = stat.ctime;
-	fhp->fh_pre_size  = stat.size;
 	fhp->fh_pre_saved = true;
 }
 
@@ -293,7 +295,9 @@ void fill_post_wcc(struct svc_fh *fhp)
 	if (fhp->fh_post_saved)
 		printk("nfsd: inode locked twice during operation.\n");
 
-	err = fh_getattr(fhp, &fhp->fh_post_attr);
+
+	if (!v4 || !inode->i_sb->s_export_op->fetch_iversion)
+		err = fh_getattr(fhp, &fhp->fh_post_attr);
 	if (v4)
 		fhp->fh_post_change =
 			nfsd4_change_attribute(&fhp->fh_post_attr, inode);
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

