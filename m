Return-Path: <linux-cachefs+bncBDLIXLMFVAERB67USWWAMGQEVNXCQMQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mail.lfdr.de (Postfix) with ESMTPS id E595081C993
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Dec 2023 13:01:00 +0100 (CET)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3ba2072052csf1979951b6e.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 22 Dec 2023 04:01:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703246459; cv=pass;
        d=google.com; s=arc-20160816;
        b=ndm+Sy1x6JW4RAjwHfRXXGxkxVQToD0DCK6E0lXRjkrEZMC36zoRbp8jY0BFFQtTPg
         vo5wMvPcaSSmFsvY5Dqp7FIyC6RKwPN25lzKacKlP1bDYgppWm7EHSzdzv6r90sclbRG
         e/qCLpKwvYXePHi9aur0XuQRBZhtILTUpzdO6PhWiMbemtIvqb63K5+B/iTLSR+1NM37
         RTNJiZxDjoZE8DYLSXnRSCgqK43Ts4LvdtGpNZRsSRGN9epwgG3UP6K6Ub0o83+rcqvA
         VumvMwsb4EijC9MiQW8NKfk8DjztVDoqWWu4J18MSnjrSrHYolU1xG8+OHP+CKEwLld5
         yOQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:references:in-reply-to:from:organization:delivered-to;
        bh=nLw9nAXgaLUJIxMgfAKPWKZi751foZTRglF3K1D+jgY=;
        fh=9v08xJNacvNjOm9W8hw7chYArnZsmswKd9C7OT6P4OA=;
        b=FH7CuOFuj4n4MkmW1LY521qLhsix7bEnF4v8fcRULmDohgTZ/BA98Qe6kQV93vMrK+
         BReEU1TQ9r7nIrODyvXYyMejQat9XQ/z5YzcuG9eYgo9YGse8VOYfP5tcn2ngLoL9BFr
         s7hCctSwrQ2Of5lSDLopaYASeRt9FdDz1wseqcBjFMqln+tqLH9piXhaGUgW5S41Qr3W
         jijIaYEeDH/x8YLnFF6Dc1NzF+KNwwWHZvE5MehT1L5gN/prgZJK8HhuArKvBK4qSOSo
         GvKC0xXwFV0YpyTJLBSlf4aAWQRFSzmdLYGYA4FZZEICspclJGR/890JW744QtjNUdbS
         jtSg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703246459; x=1703851259;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:references:in-reply-to:from
         :organization:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLw9nAXgaLUJIxMgfAKPWKZi751foZTRglF3K1D+jgY=;
        b=c52dkbUkGVzQrHRlhuwyZel7Y5oRX81KKJhvceCPAoMWBisfqY1ldpuWXYvv9VLDN3
         bwtf6xMzDQcRumVIRf77CVINqgQK1BLJUCmCq7AzeWBBcYchCP4sVpLVPPWvggL7PanM
         2A2pVjtNTHd57l6x2L4ZSjVXdwiPKlWKOmKtcwGXB0sqhFgYMLVXQCcBz744mlNRTt8i
         2A2qOsiwSu2XisY9v+wnCOjrfIk59vr4aT9OjYJdqqsKzSwK51se95WuTDM2eODIhu0J
         u0hOPTW0HSm37iWNAeMhnKjQ1QA6r2ayOUsTPd8Km6wTrF7QEm45vZCbcX1VMcz9v/Jy
         38FA==
X-Gm-Message-State: AOJu0YyhYFSaLBGhixZrjNWgSaT9jnqsNKFn24JL8q5UD4X3HergJ6Mo
	wdU3pixaMOTtWWikwIB31JKCAGLIXZmKCA==
X-Google-Smtp-Source: AGHT+IEGPZK87lUEytLMVzuCox9gznx1S0Ui8+ZpSTxjqY88cAVszYfGpolOuZRZUMWdHbdSucZf+Q==
X-Received: by 2002:a05:6808:3a0e:b0:3b9:f8eb:21ee with SMTP id gr14-20020a0568083a0e00b003b9f8eb21eemr1476780oib.104.1703246459665;
        Fri, 22 Dec 2023 04:00:59 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:501e:b0:670:a1c0:e4e2 with SMTP id
 jo30-20020a056214501e00b00670a1c0e4e2ls371782qvb.1.-pod-prod-04-us; Fri, 22
 Dec 2023 04:00:59 -0800 (PST)
X-Received: by 2002:ae9:e919:0:b0:774:1ac2:79be with SMTP id x25-20020ae9e919000000b007741ac279bemr1538532qkf.53.1703246458945;
        Fri, 22 Dec 2023 04:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703246458; cv=none;
        d=google.com; s=arc-20160816;
        b=noPQ0YsJunz7yRwadmhYX7axzU41aBEX/xaEC9odKtwpds+1bltqi3AtZFmo4YTuJ+
         RHKiKzyWsxaotKsxOpKqQ0C+jhDoWo0O43USpBpunUPuUtfFYtc8FeDJeQdti/EVNmYS
         6w+oIVPDBkrUZ5B7iv9gql4shYKPL61NPvSdvsUFsx6moQKOwxtZb8LMi6Awv7gnJVGa
         FOhCVHhBAULUI1sA7jANolLf+gKjeGHzAk9j0eUHKGEuQmNvFMsNmCg6/7JtRlhafyxy
         DOWq8Lx1pgrQ93bhMaCMG7lCcEvGyYc3Pqmi9GvwGFiar41+ipFvHrqNzDYQfmDQO3qE
         hcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:references:in-reply-to:from:organization:delivered-to;
        bh=m+nkbEwVMLToLxnhtqBtmFABHghDlax7OjwNCRCEfug=;
        fh=9v08xJNacvNjOm9W8hw7chYArnZsmswKd9C7OT6P4OA=;
        b=Wzs8c96BfRhCWW9EqwitoHTPr553kSvo6Vt+z1JYQrAl/50sHeTyeE5jNFT/EhWPTi
         sYxp7QGUovAXcy0aih3daRloPX6x8npMDcmkGvqDR1m7ZZXgedNY0VLy2f4DznWvoDHK
         SaEe02iiLtGZP7ds+AkUbl/Ww+0iPA5SkRbVNdpHCKQ0uW5eWtQcBfm84XIPq1cydW7Z
         s9oZAaOextq4CUjwgiIpuz4V0wO6ABcCgPs4lRx3zXqa3jjpZI+FJwEmvCcLAU+1wMY+
         MyOyWNnqM7mmmjK48RARDrSL0CY3thbFktanm3CbuRye3KPwAmNqJaqlSILxPP3xmxOi
         3PMA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w25-20020a05620a0e9900b007811aafa5dasi4032037qkm.45.2023.12.22.04.00.58
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 04:00:58 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-7uZtPXXIPGeZweOAAVuXzA-1; Fri,
 22 Dec 2023 07:00:56 -0500
X-MC-Unique: 7uZtPXXIPGeZweOAAVuXzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D29C63C2A1D3
	for <linux-cachefs@gapps.redhat.com>; Fri, 22 Dec 2023 12:00:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CF4CF1C060B1; Fri, 22 Dec 2023 12:00:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 776331C060AF;
	Fri, 22 Dec 2023 12:00:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2202548.1703245791@warthog.procyon.org.uk>
References: <2202548.1703245791@warthog.procyon.org.uk> <20231221230153.GA1607352@dev-arch.thelio-3990X> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-38-dhowells@redhat.com>
Cc: dhowells@redhat.com, Nathan Chancellor <nathan@kernel.org>,
    Anna Schumaker <Anna.Schumaker@Netapp.com>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH] Fix oops in NFS
MIME-Version: 1.0
Date: Fri, 22 Dec 2023 12:00:51 +0000
Message-ID: <2229136.1703246451@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2229135.1703246451.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

David Howells <dhowells@redhat.com> wrote:

> A better way, though, is to move the call to nfs_netfs_inode_init()
> and give it a flag to say whether or not we want the facility.

Okay, I think I'll fold in the attached change.

David
---
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 55345753ae8d..b66466e97459 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -249,7 +249,7 @@ void v9fs_free_inode(struct inode *inode)
 static void v9fs_set_netfs_context(struct inode *inode)
 {
 	struct v9fs_inode *v9inode = V9FS_I(inode);
-	netfs_inode_init(&v9inode->netfs, &v9fs_req_ops);
+	netfs_inode_init(&v9inode->netfs, &v9fs_req_ops, true);
 }
 
 int v9fs_init_inode(struct v9fs_session_info *v9ses,
diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 1f656005018e..9c517269ff95 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -76,7 +76,7 @@ struct inode *afs_iget_pseudo_dir(struct super_block *sb, bool root)
 	/* there shouldn't be an existing inode */
 	BUG_ON(!(inode->i_state & I_NEW));
 
-	netfs_inode_init(&vnode->netfs, NULL);
+	netfs_inode_init(&vnode->netfs, NULL, false);
 	inode->i_size		= 0;
 	inode->i_mode		= S_IFDIR | S_IRUGO | S_IXUGO;
 	if (root) {
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 2b44a342b4a1..381521e9e118 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -58,7 +58,7 @@ static noinline void dump_vnode(struct afs_vnode *vnode, struct afs_vnode *paren
  */
 static void afs_set_netfs_context(struct afs_vnode *vnode)
 {
-	netfs_inode_init(&vnode->netfs, &afs_req_ops);
+	netfs_inode_init(&vnode->netfs, &afs_req_ops, true);
 }
 
 /*
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 3149d79a9dbe..0c25d326afc4 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -574,7 +574,7 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
 	doutc(fsc->client, "%p\n", &ci->netfs.inode);
 
 	/* Set parameters for the netfs library */
-	netfs_inode_init(&ci->netfs, &ceph_netfs_ops);
+	netfs_inode_init(&ci->netfs, &ceph_netfs_ops, false);
 
 	spin_lock_init(&ci->i_ceph_lock);
 
diff --git a/fs/nfs/fscache.h b/fs/nfs/fscache.h
index 5407ab8c8783..e3cb4923316b 100644
--- a/fs/nfs/fscache.h
+++ b/fs/nfs/fscache.h
@@ -80,7 +80,7 @@ static inline void nfs_netfs_put(struct nfs_netfs_io_data *netfs)
 }
 static inline void nfs_netfs_inode_init(struct nfs_inode *nfsi)
 {
-	netfs_inode_init(&nfsi->netfs, &nfs_netfs_ops);
+	netfs_inode_init(&nfsi->netfs, &nfs_netfs_ops, false);
 }
 extern void nfs_netfs_initiate_read(struct nfs_pgio_header *hdr);
 extern void nfs_netfs_read_completion(struct nfs_pgio_header *hdr);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index a5374218efe4..06a03dd1aff1 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -456,22 +456,27 @@ static inline struct netfs_inode *netfs_inode(struct inode *inode)
  * netfs_inode_init - Initialise a netfslib inode context
  * @ctx: The netfs inode to initialise
  * @ops: The netfs's operations list
+ * @use_zero_point: True to use the zero_point read optimisation
  *
  * Initialise the netfs library context struct.  This is expected to follow on
  * directly from the VFS inode struct.
  */
 static inline void netfs_inode_init(struct netfs_inode *ctx,
-				    const struct netfs_request_ops *ops)
+				    const struct netfs_request_ops *ops,
+				    bool use_zero_point)
 {
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
-	ctx->zero_point = ctx->remote_i_size;
+	ctx->zero_point = LLONG_MAX;
 	ctx->flags = 0;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif
 	/* ->releasepage() drives zero_point */
-	mapping_set_release_always(ctx->inode.i_mapping);
+	if (use_zero_point) {
+		ctx->zero_point = ctx->remote_i_size;
+		mapping_set_release_always(ctx->inode.i_mapping);
+	}
 }
 
 /**

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

