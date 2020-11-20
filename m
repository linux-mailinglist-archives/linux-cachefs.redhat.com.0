Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 93A032BAC6D
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605884760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gpdAqOV1a5PHnKeCwoJozgarWmBC6COTD26fb/SGU+s=;
	b=N2F9KnyjBbWh23Uoc3U+qpy5CeRzFz5qQxEVhV37/tjvHMdcRbLznR36XFhvRQSHihCwJF
	p73QuHKRi05HjBdEZAlAGFPfMHFuaSH+fL42nbgxFAjAIyEysAIHXYK+y+DQzr0MI0m5i8
	ej/RfzST1CW+yj7zFeIAjGzqo8oiFKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-kCfHsupNNtmJdF3tRzTWqA-1; Fri, 20 Nov 2020 10:05:59 -0500
X-MC-Unique: kCfHsupNNtmJdF3tRzTWqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 005C28799FA;
	Fri, 20 Nov 2020 15:05:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 996C05D9D7;
	Fri, 20 Nov 2020 15:05:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 841F6180954D;
	Fri, 20 Nov 2020 15:05:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKF5tOV013196 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:05:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2FDA25D6AD; Fri, 20 Nov 2020 15:05:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46B025D6CF;
	Fri, 20 Nov 2020 15:05:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:05:48 +0000
Message-ID: <160588474843.3465195.5446072310069374803.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 15/76] fscache: Change %p in format
 strings to something else
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change plain %p in format strings in fscache code to something more useful,
since %p is now hashed before printing and thus no longer matches the
contents of an oops register dump.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/cache.c  |    8 ++++----
 fs/fscache/cookie.c |   16 +++++++---------
 fs/fscache/object.c |    1 -
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index 92f747b72ec3..60fa68c7da3a 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -118,7 +118,7 @@ struct fscache_cache *fscache_select_cache_for_object(
 			cache = NULL;
 
 		spin_unlock(&cookie->lock);
-		_leave(" = %p [parent]", cache);
+		_leave(" = %s [parent]", cache ? cache->tag->name : "NULL");
 		return cache;
 	}
 
@@ -144,14 +144,14 @@ struct fscache_cache *fscache_select_cache_for_object(
 	if (test_bit(FSCACHE_IOERROR, &tag->cache->flags))
 		return NULL;
 
-	_leave(" = %p [specific]", tag->cache);
+	_leave(" = %s [specific]", tag->name);
 	return tag->cache;
 
 no_preference:
 	/* netfs has no preference - just select first cache */
 	cache = list_entry(fscache_cache_list.next,
 			   struct fscache_cache, link);
-	_leave(" = %p [first]", cache);
+	_leave(" = %s [first]", cache->tag->name);
 	return cache;
 }
 
@@ -324,7 +324,7 @@ static void fscache_withdraw_all_objects(struct fscache_cache *cache,
 					    struct fscache_object, cache_link);
 			list_move_tail(&object->cache_link, dying_objects);
 
-			_debug("withdraw %p", object->cookie);
+			_debug("withdraw %x", object->cookie->debug_id);
 
 			/* This must be done under object_list_lock to prevent
 			 * a race with fscache_drop_object().
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index aa33d16711e1..0346bc7f5818 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -369,7 +369,7 @@ void __fscache_enable_cookie(struct fscache_cookie *cookie,
 			     bool (*can_enable)(void *data),
 			     void *data)
 {
-	_enter("%p", cookie);
+	_enter("%x", cookie->debug_id);
 
 	trace_fscache_enable(cookie);
 
@@ -464,10 +464,8 @@ static int fscache_acquire_non_index_cookie(struct fscache_cookie *cookie)
 
 	/* we may be required to wait for lookup to complete at this point */
 	if (!fscache_defer_lookup) {
-		_debug("non-deferred lookup %p", &cookie->flags);
 		wait_on_bit(&cookie->flags, FSCACHE_COOKIE_LOOKING_UP,
 			    TASK_UNINTERRUPTIBLE);
-		_debug("complete");
 		if (test_bit(FSCACHE_COOKIE_UNAVAILABLE, &cookie->flags))
 			goto unavailable;
 	}
@@ -492,7 +490,7 @@ static int fscache_alloc_object(struct fscache_cache *cache,
 	struct fscache_object *object;
 	int ret;
 
-	_enter("%p,%p{%s}", cache, cookie, cookie->type_name);
+	_enter("%s,%x{%s}", cache->tag->name, cookie->debug_id, cookie->type_name);
 
 	spin_lock(&cookie->lock);
 	hlist_for_each_entry(object, &cookie->backing_objects,
@@ -668,7 +666,7 @@ EXPORT_SYMBOL(__fscache_invalidate);
  */
 void __fscache_wait_on_invalidate(struct fscache_cookie *cookie)
 {
-	_enter("%p", cookie);
+	_enter("%x", cookie->debug_id);
 
 	wait_on_bit(&cookie->flags, FSCACHE_COOKIE_INVALIDATING,
 		    TASK_UNINTERRUPTIBLE);
@@ -723,7 +721,7 @@ void __fscache_disable_cookie(struct fscache_cookie *cookie,
 	struct fscache_object *object;
 	bool awaken = false;
 
-	_enter("%p,%u", cookie, invalidate);
+	_enter("%x,%u", cookie->debug_id, invalidate);
 
 	trace_fscache_disable(cookie);
 
@@ -808,8 +806,8 @@ void __fscache_relinquish_cookie(struct fscache_cookie *cookie,
 		return;
 	}
 
-	_enter("%p{%s,%d},%d",
-	       cookie, cookie->type_name,
+	_enter("%x{%s,%d},%d",
+	       cookie->debug_id, cookie->type_name,
 	       atomic_read(&cookie->n_active), retire);
 
 	trace_fscache_relinquish(cookie, retire);
@@ -859,7 +857,7 @@ void fscache_cookie_put(struct fscache_cookie *cookie,
 	struct fscache_cookie *parent;
 	int usage;
 
-	_enter("%p", cookie);
+	_enter("%x", cookie->debug_id);
 
 	do {
 		usage = atomic_dec_return(&cookie->usage);
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 5d50976bf379..efdd5309d88e 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -519,7 +519,6 @@ void fscache_object_lookup_negative(struct fscache_object *object)
 		set_bit(FSCACHE_COOKIE_NO_DATA_YET, &cookie->flags);
 		clear_bit(FSCACHE_COOKIE_UNAVAILABLE, &cookie->flags);
 
-		_debug("wake up lookup %p", &cookie->flags);
 		clear_bit_unlock(FSCACHE_COOKIE_LOOKING_UP, &cookie->flags);
 		wake_up_bit(&cookie->flags, FSCACHE_COOKIE_LOOKING_UP);
 	}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

