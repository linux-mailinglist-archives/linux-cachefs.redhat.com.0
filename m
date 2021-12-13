Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9F4730B6
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Dec 2021 16:41:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639410089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9PG6B0foeH9G63zJDs9N2M98Qay8+zVk6ClREfbQrvU=;
	b=FHLicdL/swbPAWbvSFGfFsgZLo/xryOb1Hx5bvZ+CBNFGifcLQBCn4U/NlCKfOPVoor6oi
	zlkXVH8wzyEYI3picJfr7ScVGc9nf7olCKy96XcwOcKLlaaVk6MosUuC3lZeoom5wx9Iz4
	qyUMF4X/ICf+S7DmPnJt9BD/YqrEknc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-xzkraadsMfi21Cn3z_HRqA-1; Mon, 13 Dec 2021 10:41:26 -0500
X-MC-Unique: xzkraadsMfi21Cn3z_HRqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2682874981;
	Mon, 13 Dec 2021 15:41:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 694B15DF4B;
	Mon, 13 Dec 2021 15:41:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85BBD4BB7C;
	Mon, 13 Dec 2021 15:41:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BDFfAxC011948 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Dec 2021 10:41:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44B4C5E26B; Mon, 13 Dec 2021 15:41:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F35D5DF4B;
	Mon, 13 Dec 2021 15:41:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALF+zOnmJ0=j8pEMikpxYgLrS10gVZiXfCjBhDz9Je0Qip7wnw@mail.gmail.com>
References: <CALF+zOnmJ0=j8pEMikpxYgLrS10gVZiXfCjBhDz9Je0Qip7wnw@mail.gmail.com>
	<163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<CALF+zOnA2U6LjDTE8m2REDTMmFVnWkcBkn0ZJQRGULPUjeQW4Q@mail.gmail.com>
To: David Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Mon, 13 Dec 2021 15:41:08 +0000
Message-ID: <599331.1639410068@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BDFfAxC011948
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>
Subject: [Linux-cachefs] [PATCH] fscache: Need to go round again after
	processing LRU_DISCARDING state
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
Content-ID: <599330.1639410068.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Wysochanski <dwysocha@redhat.com> wrote:

> > [  432.921382] BUG: KASAN: use-after-free in
> > fscache_unhash_cookie+0x9e/0x160 [fscache]^M

I think the patch below is the way to fix this.

David
---
fscache: Need to go round again after processing LRU_DISCARDING state

There's a race between the LRU discard and relinquishment actions.  In the
state machine, fscache_cookie_state_machine(), the ACTIVE state transits to
the LRU_DISCARD state in preference to transiting to the RELINQUISHING or
WITHDRAWING states.

This should be fine, but the LRU_DISCARDING state just breaks out the
bottom of the function without going round again after transiting to the
QUIESCENT state.

However, if both LRU discard and relinquishment happen *before* the SM
runs, one of the queue events will get discarded, along with the ref that
would be associated with it.  The last ref is then discarded and the cookie
is removed without completing the relinquishment process - leaving the
cookie hashed.

The fix is to make sure that the SM always goes back around after changing
the state.

Signed-off-by: David Howells <dhowells@redhat.com>
---

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index d7e825d636e2..8d0769a5ee2b 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -755,7 +755,7 @@ static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
 		set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 		__fscache_set_cookie_state(cookie, FSCACHE_COOKIE_STATE_QUIESCENT);
 		wake = true;
-		break;
+		goto again_locked;
 
 	case FSCACHE_COOKIE_STATE_DROPPED:
 		break;

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

