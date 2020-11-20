Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 138A92BB920
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605911977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KHdWsO28G72nt3iyJkli5OQ+lxM8v1wdPOEm9wvMWk0=;
	b=IYIZt4jNLM7QNkk8TaW3zVFyQnxHGKNJU+RjOlI6gBU2BFwf6+8sFbQCRg5AeaC4A6mqCs
	msB4llj6FfcwQwmCV1T5FmNu2YxTABKhABl8BSvTr3Tx8CDa8zgGN5bkz7q4ubzw3TlXQL
	Iav2zlSKPGMrUOna9rQFvRfd2oBpmU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-Xk-k3QTlOmWpIx1kH-GGzg-1; Fri, 20 Nov 2020 17:39:34 -0500
X-MC-Unique: Xk-k3QTlOmWpIx1kH-GGzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3BD51074649;
	Fri, 20 Nov 2020 22:39:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3B2410013C0;
	Fri, 20 Nov 2020 22:39:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB3BB5002C;
	Fri, 20 Nov 2020 22:39:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMdUh1019109 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:39:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 52807115D354; Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E4B2101F0BE
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43E5B800B3B
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:28 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-278-ydALpUamNyaWa1vCUuHuPg-1;
	Fri, 20 Nov 2020 17:39:23 -0500
X-MC-Unique: ydALpUamNyaWa1vCUuHuPg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id EB0FF449B; Fri, 20 Nov 2020 17:39:21 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org EB0FF449B
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Nov 2020 17:39:13 -0500
Message-Id: <1605911960-12516-1-git-send-email-bfields@redhat.com>
In-Reply-To: <20201120223831.GB7705@fieldses.org>
References: <20201120223831.GB7705@fieldses.org>
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
Subject: [Linux-cachefs] [PATCH 1/8] nfsd: only call inode_query_iversion in
	the I_VERSION case
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "J. Bruce Fields" <bfields@redhat.com>

inode_query_iversion() can modify i_version.  Depending on the exported
filesystem, that may not be safe.  For example, if you're re-exporting
NFS, NFS stores the server's change attribute in i_version and does not
expect it to be modified locally.  This has been observed causing
unnecssary cache invalidations.

The way a filesystem indicates that it's OK to call
inode_query_iverson() is by setting SB_I_VERSION.

(This may look like a no-op--in the encode_change() case it's just
rearranging some code--but note nfsd4_change_attribute() is also called
from fill_pre_wcc() and fill_post_wcc().)

(Note we could also pull the NFSEXP_V4ROOT case into
nfsd4_change_attribute as well.  That would actually be a no-op, since
pre/post attrs are only used for metadata-modifying operations, and
V4ROOT exports are read-only.  But we might make the change in the
future just for simplicity.)

Reported-by: Daire Byrne <daire@dneg.com>
Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfsd/nfs4xdr.c |  6 +-----
 fs/nfsd/nfsfh.h   | 14 ++++++++++----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 833a2c64dfe8..56fd5f6d5c44 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -2298,12 +2298,8 @@ static __be32 *encode_change(__be32 *p, struct kstat *stat, struct inode *inode,
 	if (exp->ex_flags & NFSEXP_V4ROOT) {
 		*p++ = cpu_to_be32(convert_to_wallclock(exp->cd->flush_time));
 		*p++ = 0;
-	} else if (IS_I_VERSION(inode)) {
+	} else
 		p = xdr_encode_hyper(p, nfsd4_change_attribute(stat, inode));
-	} else {
-		*p++ = cpu_to_be32(stat->ctime.tv_sec);
-		*p++ = cpu_to_be32(stat->ctime.tv_nsec);
-	}
 	return p;
 }
 
diff --git a/fs/nfsd/nfsfh.h b/fs/nfsd/nfsfh.h
index 56cfbc361561..3faf5974fa4e 100644
--- a/fs/nfsd/nfsfh.h
+++ b/fs/nfsd/nfsfh.h
@@ -261,10 +261,16 @@ static inline u64 nfsd4_change_attribute(struct kstat *stat,
 {
 	u64 chattr;
 
-	chattr =  stat->ctime.tv_sec;
-	chattr <<= 30;
-	chattr += stat->ctime.tv_nsec;
-	chattr += inode_query_iversion(inode);
+	if (IS_I_VERSION(inode)) {
+		chattr =  stat->ctime.tv_sec;
+		chattr <<= 30;
+		chattr += stat->ctime.tv_nsec;
+		chattr += inode_query_iversion(inode);
+	} else {
+		chattr = cpu_to_be32(stat->ctime.tv_sec);
+		chattr <<= 32;
+		chattr += cpu_to_be32(stat->ctime.tv_nsec);
+	}
 	return chattr;
 }
 
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

