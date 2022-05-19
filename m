Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75552CD88
	for <lists+linux-cachefs@lfdr.de>; Thu, 19 May 2022 09:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652946700;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S+HYJ/qpYYKvWfPIjjQ3B9+zWhxEkTYNkLQXC5Cr9WA=;
	b=RwJZJUZzNVJwhxwUFruBFxYogX3QAixlsdrJsLGW0RqxlvDwjP/Y/Dw2JbTtSgtx02N7oE
	2whcTU41fRc4Jg4mPHV+yUkocqbLT3gNoNGHKF6zalicmGKQ1aVuopwQHRupOIcSaPcs97
	EoC7O+fzJKcJYKtlh4qo4kE9XZ9Hmms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281--hzoBio7OSGQjbrv00OAjA-1; Thu, 19 May 2022 03:51:37 -0400
X-MC-Unique: -hzoBio7OSGQjbrv00OAjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFF3E801210;
	Thu, 19 May 2022 07:51:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3407C1121314;
	Thu, 19 May 2022 07:51:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E08971949759;
	Thu, 19 May 2022 07:51:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A78C91947B8F for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 19 May 2022 07:51:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 888E540C1438; Thu, 19 May 2022 07:51:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2FA40C1421;
 Thu, 19 May 2022 07:51:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: trond.myklebust@hammerspace.com, anna@kernel.org
Date: Thu, 19 May 2022 08:51:32 +0100
Message-ID: <165294669215.3283481.13374322806917745974.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH] nfs: Fix fscache volume key rendering for
 endianness
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
Cc: linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix fscache volume key rendering for endianness.  Convert the BE numbers in
the address to host-endian before printing them so that they're consistent
if the cache is copied between architectures.

Question: This change could lead to misidentification of a volume directory
in the cache on a LE machine (it's unlikely because the port number as well
as the address numbers all get flipped), but it was introduced in -rc1 in
this cycle so probably isn't in any distro kernels yet.  Should I add a
version number to enforce non-matching?

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Dave Wysochanski <dwysocha@redhat.com>
cc: Trond Myklebust <trond.myklebust@hammerspace.com>
cc: Anna Schumaker <anna@kernel.org>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-nfs@vger.kernel.org
cc: linux-cachefs@redhat.com
---

 fs/nfs/fscache.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index f73c09a9cf0a..0e5572b192b2 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -54,17 +54,17 @@ static bool nfs_fscache_get_client_key(struct nfs_client *clp,
 
 	switch (clp->cl_addr.ss_family) {
 	case AF_INET:
-		if (!nfs_append_int(key, _len, sin->sin_port) ||
-		    !nfs_append_int(key, _len, sin->sin_addr.s_addr))
+		if (!nfs_append_int(key, _len, ntohs(sin->sin_port)) ||
+		    !nfs_append_int(key, _len, ntohl(sin->sin_addr.s_addr)))
 			return false;
 		return true;
 
 	case AF_INET6:
-		if (!nfs_append_int(key, _len, sin6->sin6_port) ||
-		    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[0]) ||
-		    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[1]) ||
-		    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[2]) ||
-		    !nfs_append_int(key, _len, sin6->sin6_addr.s6_addr32[3]))
+		if (!nfs_append_int(key, _len, ntohs(sin6->sin6_port)) ||
+		    !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[0])) ||
+		    !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[1])) ||
+		    !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[2])) ||
+		    !nfs_append_int(key, _len, ntohl(sin6->sin6_addr.s6_addr32[3])))
 			return false;
 		return true;
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

