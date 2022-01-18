Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7534927A4
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:54:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642514081;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gHaVPTWsY2uoA3SI6whyHMuh465ZfW+E4q+5aOcmtSE=;
	b=DLTCp866PwgwS8VD2eZPZBaXb/K86yZ4ffNNNr59DC7kggmHO4SFgzGYDkdW2O1GUsnfTf
	ZmrR3PiqbtI2qLGBVTtYj9mQUy2QEWwfw8oSF4PJ54EpwecjhVDHPjgHdLAo14T3C3NvPE
	z6S40YiQtCJrPGFGUFkIkkxGr5nSxPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-02snSJTLPMe0B54mgFiZWw-1; Tue, 18 Jan 2022 08:54:37 -0500
X-MC-Unique: 02snSJTLPMe0B54mgFiZWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE4A11052BB5;
	Tue, 18 Jan 2022 13:54:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C5E678ABA;
	Tue, 18 Jan 2022 13:54:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41C944BB7B;
	Tue, 18 Jan 2022 13:54:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDrqYR014051 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:53:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7D03108F841; Tue, 18 Jan 2022 13:53:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 034CB10589CF;
	Tue, 18 Jan 2022 13:53:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 18 Jan 2022 13:53:19 +0000
Message-ID: <164251399914.3435901.4761991152407411408.stgit@warthog.procyon.org.uk>
In-Reply-To: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH 03/11] cachefiles: set default tag name if
	it's unspecified
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jeffle Xu <jefflexu@linux.alibaba.com>

fscache_acquire_cache() requires a non-empty name, while 'tag <name>'
command is optional for cachefilesd.

Thus set default tag name if it's unspecified to avoid the regression of
cachefilesd. The logic is the same with that before rewritten.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/daemon.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 40a792421fc1..7ac04ee2c0a0 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -703,6 +703,17 @@ static int cachefiles_daemon_bind(struct cachefiles_cache *cache, char *args)
 		return -EBUSY;
 	}
 
+	/* Make sure we have copies of the tag string */
+	if (!cache->tag) {
+		/*
+		 * The tag string is released by the fops->release()
+		 * function, so we don't release it on error here
+		 */
+		cache->tag = kstrdup("CacheFiles", GFP_KERNEL);
+		if (!cache->tag)
+			return -ENOMEM;
+	}
+
 	return cachefiles_add_cache(cache);
 }
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

