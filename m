Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1335089DA
	for <lists+linux-cachefs@lfdr.de>; Wed, 20 Apr 2022 15:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650462952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FSzIIrPxDZxyhTrVU09Hc6stmRicbC3F0Z7S/C7ue1o=;
	b=aHsj5Qa6GNgdLgGtvavcufcbRoPG/Av9MQrfmgyFm558acZejPIRtKMfK/tDzgjm21/Da7
	YwvcZCF0FA7Oeg9V1BOVIVpNs6E+R9OycAtaERp5AbMg6PHEikgTrfGLWTI0T1jBFr7SZC
	kr1t7oOADb4esuYpYGPMQnClkEIsL+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-7cN_KwDPPNG5q-VA3plQIQ-1; Wed, 20 Apr 2022 09:55:50 -0400
X-MC-Unique: 7cN_KwDPPNG5q-VA3plQIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A3C29AA3BA;
	Wed, 20 Apr 2022 13:55:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3A627774;
	Wed, 20 Apr 2022 13:55:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7131B1949763;
	Wed, 20 Apr 2022 13:55:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B50A319451EC for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 20 Apr 2022 13:55:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9652D2024CC2; Wed, 20 Apr 2022 13:55:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BE442026D2D;
 Wed, 20 Apr 2022 13:55:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Yl75D02pXj71kQBx@rabbit.intern.cm-ag>
References: <Yl75D02pXj71kQBx@rabbit.intern.cm-ag>
 <Yl7d++G25sNXIR+p@rabbit.intern.cm-ag> <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <507518.1650383808@warthog.procyon.org.uk>
 <509961.1650386569@warthog.procyon.org.uk>
To: Max Kellermann <mk@cm4all.com>
MIME-Version: 1.0
Date: Wed, 20 Apr 2022 14:55:34 +0100
Message-ID: <705278.1650462934@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Linux-cachefs] fscache corruption in Linux 5.17?
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <705277.1650462934.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Max Kellermann <mk@cm4all.com> wrote:

> > Do the NFS servers change the files that are being served - or is it
> > just WordPress pushing the changes to the NFS servers for the web
> > servers to then export?
> 
> I'm not sure if I understand this question correctly.  The NFS server
> (a NetApp, btw.) sees the new file contents correctly; all other web
> servers also see non-corrupt new files.  Only the one web server which
> performed the update saw broken files.

I was wondering if there was missing invalidation if the web clients were
modifying the same files in parallel, but it sounds like only one place is
doing the modification, and the problem is the lack of invalidation when a
file is opened for writing.

I have a tentative patch for this - see attached.

David
---
commit 9b00af0190dfee6073aab47ee88e15c31d3c357d
Author: David Howells <dhowells@redhat.com>
Date:   Wed Apr 20 14:27:17 2022 +0100

    fscache: Fix invalidation/lookup race
    
    If an NFS file is opened for writing and closed, fscache_invalidate() will
    be asked to invalidate the file - however, if the cookie is in the
    LOOKING_UP state (or the CREATING state), then request to invalidate
    doesn't get recorded for fscache_cookie_state_machine() to do something
    with.
    
    Fix this by making __fscache_invalidate() set a flag if it sees the cookie
    is in the LOOKING_UP state to indicate that we need to go to invalidation.
    Note that this requires a count on the n_accesses counter for the state
    machine, which that will release when it's done.
    
    fscache_cookie_state_machine() then shifts to the INVALIDATING state if it
    sees the flag.
    
    Without this, an nfs file can get corrupted if it gets modified locally and
    then read locally as the cache contents may not get updated.
    
    Fixes: d24af13e2e23 ("fscache: Implement cookie invalidation")
    Reported-by: Max Kellermann <mk@cm4all.com>
    Signed-off-by: David Howells <dhowells@redhat.com>
    Link: https://lore.kernel.org/r/YlWWbpW5Foynjllo@rabbit.intern.cm-ag [1]

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 9d3cf0111709..3bb6deeb4279 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -705,7 +705,11 @@ static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
 		spin_unlock(&cookie->lock);
 		fscache_init_access_gate(cookie);
 		fscache_perform_lookup(cookie);
-		goto again;
+		spin_lock(&cookie->lock);
+		if (test_and_clear_bit(FSCACHE_COOKIE_DO_INVALIDATE, &cookie->flags))
+			__fscache_set_cookie_state(cookie,
+						   FSCACHE_COOKIE_STATE_INVALIDATING);
+		goto again_locked;
 
 	case FSCACHE_COOKIE_STATE_INVALIDATING:
 		spin_unlock(&cookie->lock);
@@ -752,6 +756,9 @@ static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
 			spin_lock(&cookie->lock);
 		}
 
+		if (test_and_clear_bit(FSCACHE_COOKIE_DO_INVALIDATE, &cookie->flags))
+			fscache_end_cookie_access(cookie, fscache_access_invalidate_cookie_end);
+
 		switch (state) {
 		case FSCACHE_COOKIE_STATE_RELINQUISHING:
 			fscache_see_cookie(cookie, fscache_cookie_see_relinquish);
@@ -1048,6 +1055,9 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
 		return;
 
 	case FSCACHE_COOKIE_STATE_LOOKING_UP:
+		__fscache_begin_cookie_access(cookie, fscache_access_invalidate_cookie);
+		set_bit(FSCACHE_COOKIE_DO_INVALIDATE, &cookie->flags);
+		fallthrough;
 	case FSCACHE_COOKIE_STATE_CREATING:
 		spin_unlock(&cookie->lock);
 		_leave(" [look %x]", cookie->inval_counter);
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index e25539072463..a25804f141d3 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -129,6 +129,7 @@ struct fscache_cookie {
 #define FSCACHE_COOKIE_DO_PREP_TO_WRITE	12		/* T if cookie needs write preparation */
 #define FSCACHE_COOKIE_HAVE_DATA	13		/* T if this cookie has data stored */
 #define FSCACHE_COOKIE_IS_HASHED	14		/* T if this cookie is hashed */
+#define FSCACHE_COOKIE_DO_INVALIDATE	15		/* T if cookie needs invalidation */
 
 	enum fscache_cookie_state	state;
 	u8				advice;		/* FSCACHE_ADV_* */
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

