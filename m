Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B88284F9FE9
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 Apr 2022 01:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649459236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vJbUR9o79Q6rCwcuJDJF1E1nQRXn9UpDpkV9c8D0sP0=;
	b=gPr/mS0c7RlcOhq4lkMpYEGge2+O4nJVBWVi6H/cfqSMczSGw3DCpwVu1hZKX5xc8mNMoj
	Xk6Vi8u8G8/j32/qxggtUYkk7oP17Dr0oYi2pJGm9A5EBCXnoZGFC6QOQfqvjYQbhhfs6w
	3k9Cj4HJnsMry6R6FEKFHvoa/OmLIK0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-HNvKCDcFO8msKT-yc575rw-1; Fri, 08 Apr 2022 19:07:14 -0400
X-MC-Unique: HNvKCDcFO8msKT-yc575rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F5C3282B7F5;
	Fri,  8 Apr 2022 23:07:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55FF32166BA3;
	Fri,  8 Apr 2022 23:07:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C7A5194034A;
	Fri,  8 Apr 2022 23:07:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 38BC71940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 23:07:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2B57D815A; Fri,  8 Apr 2022 23:07:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAB388145;
 Fri,  8 Apr 2022 23:07:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Sat, 09 Apr 2022 00:07:02 +0100
Message-ID: <164945922215.773423.3235931910808608985.stgit@warthog.procyon.org.uk>
In-Reply-To: <164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk>
References: <164945915630.773423.14655306154231712324.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH 7/8] fscache: Use wrapper
 fscache_set_cache_state() directly when relinquishing
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Yue Hu <huyue2@coolpad.com>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yue Hu <huyue2@coolpad.com>

We already have the wrapper function to set cache state.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
cc: linux-cachefs@redhat.com
Link: https://listman.redhat.com/archives/linux-cachefs/2022-April/006648.html # v1
---

 fs/fscache/cache.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index 2749933852a9..d645f8b302a2 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -214,7 +214,7 @@ void fscache_relinquish_cache(struct fscache_cache *cache)
 
 	cache->ops = NULL;
 	cache->cache_priv = NULL;
-	smp_store_release(&cache->state, FSCACHE_CACHE_IS_NOT_PRESENT);
+	fscache_set_cache_state(cache, FSCACHE_CACHE_IS_NOT_PRESENT);
 	fscache_put_cache(cache, where);
 }
 EXPORT_SYMBOL(fscache_relinquish_cache);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

