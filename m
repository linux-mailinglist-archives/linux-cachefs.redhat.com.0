Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC2C62BB923
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605911978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dWKdlWurtiKyXnqsVAl1O+7kR+bbWiBq6GwD/OB6Mto=;
	b=dyueMD6N8VPAVIcP3OIeMzY39IkapcRgRa9nhu1RfCuo3egmWkboYlFn7YO+785M6vV+yK
	bi2bd3UkdMUVP2q/vi/n3SxCoK2lT6DvvtdrfGkb/nxFxOgAtsN/dspIBr/K7SCHvJ+LIZ
	rmJ7pvGXH6SN4UqSt4vlZZkp9A/80sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-SG_iiQJ_PP-MVCyBCTQLXw-1; Fri, 20 Nov 2020 17:39:36 -0500
X-MC-Unique: SG_iiQJ_PP-MVCyBCTQLXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38251084421;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2DFC5C233;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8ED374E58F;
	Fri, 20 Nov 2020 22:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMdUY7019128 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:39:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7B5D2166B2B; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C33672166B28
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8EC5186E121
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:27 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-241-zIrjFWKsPE6_8Z5TjBWlFA-1;
	Fri, 20 Nov 2020 17:39:22 -0500
X-MC-Unique: zIrjFWKsPE6_8Z5TjBWlFA-1
Received: by fieldses.org (Postfix, from userid 2815)
	id F083941A3; Fri, 20 Nov 2020 17:39:21 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org F083941A3
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Nov 2020 17:39:14 -0500
Message-Id: <1605911960-12516-2-git-send-email-bfields@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 2/8] nfsd: simplify nfsd4_change_info
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "J. Bruce Fields" <bfields@redhat.com>

It doesn't make sense to carry all these extra fields around.  Just
make everything into change attribute from the start.

This is just cleanup, there should be no change in behavior.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfsd/nfs4xdr.c        | 11 ++---------
 fs/nfsd/xdr4.h           | 22 +++++++++-------------
 include/linux/iversion.h | 13 +++++++++++++
 3 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 56fd5f6d5c44..18c912930947 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2331,15 +2331,8 @@ static __be32 *encode_time_delta(__be32 *p, struct inode *inode)
 static __be32 *encode_cinfo(__be32 *p, struct nfsd4_change_info *c)
 {
 	*p++ = cpu_to_be32(c->atomic);
-	if (c->change_supported) {
-		p = xdr_encode_hyper(p, c->before_change);
-		p = xdr_encode_hyper(p, c->after_change);
-	} else {
-		*p++ = cpu_to_be32(c->before_ctime_sec);
-		*p++ = cpu_to_be32(c->before_ctime_nsec);
-		*p++ = cpu_to_be32(c->after_ctime_sec);
-		*p++ = cpu_to_be32(c->after_ctime_nsec);
-	}
+	p = xdr_encode_hyper(p, c->before_change);
+	p = xdr_encode_hyper(p, c->after_change);
 	return p;
 }
 
diff --git a/fs/nfsd/xdr4.h b/fs/nfsd/xdr4.h
index 679d40af1bbb..9c2d942d055d 100644
--- a/fs/nfsd/xdr4.h
+++ b/fs/nfsd/xdr4.h
@@ -76,12 +76,7 @@ static inline bool nfsd4_has_session(struct nfsd4_compound_state *cs)
 
 struct nfsd4_change_info {
 	u32		atomic;
-	bool		change_supported;
-	u32		before_ctime_sec;
-	u32		before_ctime_nsec;
 	u64		before_change;
-	u32		after_ctime_sec;
-	u32		after_ctime_nsec;
 	u64		after_change;
 };
 
@@ -768,15 +763,16 @@ set_change_info(struct nfsd4_change_info *cinfo, struct svc_fh *fhp)
 {
 	BUG_ON(!fhp->fh_pre_saved);
 	cinfo->atomic = (u32)fhp->fh_post_saved;
-	cinfo->change_supported = IS_I_VERSION(d_inode(fhp->fh_dentry));
-
-	cinfo->before_change = fhp->fh_pre_change;
-	cinfo->after_change = fhp->fh_post_change;
-	cinfo->before_ctime_sec = fhp->fh_pre_ctime.tv_sec;
-	cinfo->before_ctime_nsec = fhp->fh_pre_ctime.tv_nsec;
-	cinfo->after_ctime_sec = fhp->fh_post_attr.ctime.tv_sec;
-	cinfo->after_ctime_nsec = fhp->fh_post_attr.ctime.tv_nsec;
 
+	if (IS_I_VERSION(d_inode(fhp->fh_dentry))) {
+		cinfo->before_change = fhp->fh_pre_change;
+		cinfo->after_change = fhp->fh_post_change;
+	} else {
+		cinfo->before_change =
+			time_to_chattr(&fhp->fh_pre_ctime);
+		cinfo->after_change =
+			time_to_chattr(&fhp->fh_post_attr.ctime);
+	}
 }
 
 
diff --git a/include/linux/iversion.h b/include/linux/iversion.h
index 2917ef990d43..3bfebde5a1a6 100644
--- a/include/linux/iversion.h
+++ b/include/linux/iversion.h
@@ -328,6 +328,19 @@ inode_query_iversion(struct inode *inode)
 	return cur >> I_VERSION_QUERIED_SHIFT;
 }
 
+/*
+ * For filesystems without any sort of change attribute, the best we can
+ * do is fake one up from the ctime:
+ */
+static inline u64 time_to_chattr(struct timespec64 *t)
+{
+	u64 chattr = t->tv_sec;
+
+	chattr <<= 32;
+	chattr += t->tv_nsec;
+	return chattr;
+}
+
 /**
  * inode_eq_iversion_raw - check whether the raw i_version counter has changed
  * @inode: inode to check
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

