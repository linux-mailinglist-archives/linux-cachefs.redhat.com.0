Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF334D4EE1
	for <lists+linux-cachefs@lfdr.de>; Thu, 10 Mar 2022 17:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646929235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TqDupiIPEpRvV84JWy+Qs05Ke+aLwMBMeOb6Mf2Fcrw=;
	b=P1jRJMvcKr4lR42DvaSdP2RwRiY8ddhDktuVAQTK6OnUbgA961YmbitW58Vncc0Z0RiNop
	V/AF4EZLPnRkON02B5bnsKF3Q3dwySjduhnLqxmdRhKYIltuzs4nfdkIR+tR/BnMAfBJP3
	txSpD7hNSmN2zovBc0U0Bx7egMmWk+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-DvVvsHf7NVClMtSCqM0D1w-1; Thu, 10 Mar 2022 11:20:33 -0500
X-MC-Unique: DvVvsHf7NVClMtSCqM0D1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DFE7899ECF;
	Thu, 10 Mar 2022 16:20:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19B65C4C7A4;
	Thu, 10 Mar 2022 16:20:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CBECB194E015;
	Thu, 10 Mar 2022 16:20:31 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05E5119452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 10 Mar 2022 16:20:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8BCF107302E; Thu, 10 Mar 2022 16:20:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81B261073025;
 Thu, 10 Mar 2022 16:20:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 10 Mar 2022 16:20:18 +0000
Message-ID: <164692921865.2099075.5310757978508056134.stgit@warthog.procyon.org.uk>
In-Reply-To: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
References: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: [Linux-cachefs] [PATCH v3 19/20] netfs: Keep track of the actual
 remote file size
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a place in which to keep track of the actual remote file size in
the netfs context.  This is needed because inode->i_size will be updated as
we buffer writes in the pagecache, but the server file size won't get
updated until we flush them back.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/164623013727.3564931.17659955636985232717.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/164678219305.1200972.6459431995188365134.stgit@warthog.procyon.org.uk/ # v2
---

 include/linux/netfs.h |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 8458b30172a5..c7bf1eaf51d5 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -126,6 +126,7 @@ struct netfs_i_context {
 #if IS_ENABLED(CONFIG_FSCACHE)
 	struct fscache_cookie	*cache;
 #endif
+	loff_t			remote_i_size;	/* Size of the remote file */
 };
 
 /*
@@ -324,6 +325,21 @@ static inline void netfs_i_context_init(struct inode *inode,
 
 	memset(ctx, 0, sizeof(*ctx));
 	ctx->ops = ops;
+	ctx->remote_i_size = i_size_read(inode);
+}
+
+/**
+ * netfs_resize_file - Note that a file got resized
+ * @inode: The inode being resized
+ * @new_i_size: The new file size
+ *
+ * Inform the netfs lib that a file got resized so that it can adjust its state.
+ */
+static inline void netfs_resize_file(struct inode *inode, loff_t new_i_size)
+{
+	struct netfs_i_context *ctx = netfs_i_context(inode);
+
+	ctx->remote_i_size = new_i_size;
 }
 
 /**


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

