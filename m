Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E38812BAF1B
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605886754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3RNXoirzHOSk4bmc4YrZiUvROt4yEvWttYH4LDKM/Lk=;
	b=i8N2Br/MFFVzkZgo348Wnw2IfZgCo6H8te2jWcEXgweBJ1OjZSrfKYoCVTA61G/hu6kbAr
	QNOCv91ALDAKdPUAZpFAhhaQb8u7GkkZ2FwZr9CIzlH3s92g0IUfg5pkQ5REZLwAvNLfhQ
	x4rLCO04W99L4VeNZmn+QCi5jCSCbcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-JIkLXCTbOOqaReh8B59lEQ-1; Fri, 20 Nov 2020 10:39:11 -0500
X-MC-Unique: JIkLXCTbOOqaReh8B59lEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 769B385C738;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A7D60C05;
	Fri, 20 Nov 2020 15:39:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B04B41809CA2;
	Fri, 20 Nov 2020 15:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AH3IFmB002016 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 22:18:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1413A8A4D1; Tue, 17 Nov 2020 03:18:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EE179D466
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:18:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE0628007D9
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:18:12 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-365-FG3fL2TJNuav3XS7IwR8Dg-1;
	Mon, 16 Nov 2020 22:18:09 -0500
X-MC-Unique: FG3fL2TJNuav3XS7IwR8Dg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id B4FD57EC; Mon, 16 Nov 2020 22:18:08 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org B4FD57EC
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Date: Mon, 16 Nov 2020 22:18:06 -0500
Message-Id: <1605583086-19869-4-git-send-email-bfields@redhat.com>
In-Reply-To: <1605583086-19869-1-git-send-email-bfields@redhat.com>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-1-git-send-email-bfields@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 20 Nov 2020 10:39:06 -0500
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	"J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: [Linux-cachefs] [PATCH 4/4] nfs: support i_version in the NFSv4 case
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

Currently when knfsd re-exports an NFS filesystem, it uses the ctime as
the change attribute.  But obviously we have a real change
attribute--the one that was returned from the original server.  We
should just use that.

Signed-off-by: J. Bruce Fields <bfields@redhat.com>
---
 fs/nfs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 4034102010f0..ca85f81d1b9e 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -1045,6 +1045,7 @@ static void nfs_fill_super(struct super_block *sb, struct nfs_fs_context *ctx)
 	} else {
 		sb->s_time_min = S64_MIN;
 		sb->s_time_max = S64_MAX;
+		sb->s_flags |= SB_I_VERSION;
 	}
 
 	sb->s_magic = NFS_SUPER_MAGIC;
-- 
2.28.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

