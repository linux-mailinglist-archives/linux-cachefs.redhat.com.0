Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 79BA81CBA8C
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 May 2020 00:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588976244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5nVNrb9viktr+WTasU4r2wYpjEe4WrUpDJHcyicJ9N4=;
	b=ZDip2p/HSKQE2n428i3b1N08DfYii/hx1iPe86fsI1mF8weT507uM41Jjl8SI5QLhXMztW
	GO2ghjxPzVWgpt0z+Uo+RNYMPNZg1bAvcQF6VvlfDYQu9gsTWX8F1u0dbuFkDKa/1+PV4f
	BcAdPkZL5WPrIBENfXhZj0frmNcBRiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-bOx7xm0XN8OS32ROADAriA-1; Fri, 08 May 2020 18:17:22 -0400
X-MC-Unique: bOx7xm0XN8OS32ROADAriA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E32BE84B8A0;
	Fri,  8 May 2020 22:17:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE913100164D;
	Fri,  8 May 2020 22:17:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACC9D4CAA7;
	Fri,  8 May 2020 22:17:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048MHIqL023830 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 18:17:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D7781CF; Fri,  8 May 2020 22:17:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
	[10.10.118.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 019216AD09;
	Fri,  8 May 2020 22:17:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Fri, 08 May 2020 23:17:13 +0100
Message-ID: <158897623318.1119820.7449630665489854540.stgit@warthog.procyon.org.uk>
In-Reply-To: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
References: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 3/5] NFS: Fix fscache super_cookie allocation
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dave Wysochanski <dwysocha@redhat.com>

Commit f2aedb713c28 ("NFS: Add fs_context support.") reworked
NFS mount code paths for fs_context support which included
super_block initialization.  In the process there was an extra
return left in the code and so we never call
nfs_fscache_get_super_cookie even if 'fsc' is given on as mount
option.  In addition, there is an extra check inside
nfs_fscache_get_super_cookie for the NFS_OPTION_FSCACHE which
is unnecessary since the only caller nfs_get_cache_cookie
checks this flag.

Fixes: f2aedb713c28 ("NFS: Add fs_context support.")
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/nfs/fscache.c |    2 --
 fs/nfs/super.c   |    1 -
 2 files changed, 3 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 8eff1fd806b1..f51718415606 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -118,8 +118,6 @@ void nfs_fscache_get_super_cookie(struct super_block *sb, const char *uniq, int
 
 	nfss->fscache_key = NULL;
 	nfss->fscache = NULL;
-	if (!(nfss->options & NFS_OPTION_FSCACHE))
-		return;
 	if (!uniq) {
 		uniq = "";
 		ulen = 1;
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 59ef3b13ccca..cc34aa3a8ba4 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -1189,7 +1189,6 @@ static void nfs_get_cache_cookie(struct super_block *sb,
 			uniq = ctx->fscache_uniq;
 			ulen = strlen(ctx->fscache_uniq);
 		}
-		return;
 	}
 
 	nfs_fscache_get_super_cookie(sb, uniq, ulen);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

