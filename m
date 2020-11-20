Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95AC52BB91C
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 23:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605911975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GDJQ54uStxPBFXVQGXgTQkeNFyxGACFVm/IbS0STzVg=;
	b=MQV7GgqMQZ+Ks3sofBNYlngxpCyKI3eARKYZaWzEsB+xAThDT3XpqoiocG4XFg175fglOw
	wdw7AJL5FDjWTI3kmc35t3yEpjfHXfB3fDvt3WXjigOZsjZqwlfU2NEJW3e5HNv3dWyXr9
	Hi54pZYd8SGfB2CZp9nZT3DBnIoWNeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-7c2J1sFGOlGeu5CoyPIDPA-1; Fri, 20 Nov 2020 17:39:33 -0500
X-MC-Unique: 7c2J1sFGOlGeu5CoyPIDPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 129658144EF;
	Fri, 20 Nov 2020 22:39:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCCC65C1D5;
	Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89451180954D;
	Fri, 20 Nov 2020 22:39:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKMdS6x019090 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 17:39:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 793B82026D48; Fri, 20 Nov 2020 22:39:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74BED2026D47
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EA6C800B3A
	for <linux-cachefs@redhat.com>; Fri, 20 Nov 2020 22:39:26 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-454-wdumTR1OOJa1GZ1_jpI9xQ-1;
	Fri, 20 Nov 2020 17:39:23 -0500
X-MC-Unique: wdumTR1OOJa1GZ1_jpI9xQ-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 0181A41A2; Fri, 20 Nov 2020 17:39:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 0181A41A2
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Nov 2020 17:39:15 -0500
Message-Id: <1605911960-12516-3-git-send-email-bfields@redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 3/8] nfsd: minor nfsd4_change_attribute
	cleanup
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

Minor cleanup, no change in behavior

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfsd/nfsfh.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/nfsd/nfsfh.h b/fs/nfsd/nfsfh.h
index 3faf5974fa4e..45bd776290d5 100644
--- a/fs/nfsd/nfsfh.h
+++ b/fs/nfsd/nfsfh.h
@@ -259,19 +259,16 @@ fh_clear_wcc(struct svc_fh *fhp)
 static inline u64 nfsd4_change_attribute(struct kstat *stat,
 					 struct inode *inode)
 {
-	u64 chattr;
-
 	if (IS_I_VERSION(inode)) {
+		u64 chattr;
+
 		chattr =  stat->ctime.tv_sec;
 		chattr <<= 30;
 		chattr += stat->ctime.tv_nsec;
 		chattr += inode_query_iversion(inode);
-	} else {
-		chattr = cpu_to_be32(stat->ctime.tv_sec);
-		chattr <<= 32;
-		chattr += cpu_to_be32(stat->ctime.tv_nsec);
-	}
-	return chattr;
+		return chattr;
+	} else
+		return time_to_chattr(&stat->ctime);
 }
 
 extern void fill_pre_wcc(struct svc_fh *fhp);
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

