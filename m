Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5147319D
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Dec 2021 17:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639412589;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NS/4BGasSyapFwaJNJnoHNieHjXVIngC2P4FUUbYiRc=;
	b=EnHKxvLvf+o1V9wA/FxZ3jaYWzOk+tiu+LL3/2YOvLDMwv7QmCUSZg6IbHcj6KltLHykyN
	5KW3jGwLHY2iP45RPNjg3p9mi+I3OwRzFkkWMVzp7mcPGtDuDddoY1aqsdRg07+XK34rBI
	VMRBHe31C2dl/pGBY3YUm1LmAKBE4+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-6UfsXkPZOSS4QZQvXGFidw-1; Mon, 13 Dec 2021 11:23:04 -0500
X-MC-Unique: 6UfsXkPZOSS4QZQvXGFidw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11927802C91;
	Mon, 13 Dec 2021 16:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E38E2B88B;
	Mon, 13 Dec 2021 16:23:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C18471809CB8;
	Mon, 13 Dec 2021 16:22:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BDGMuVd015748 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Dec 2021 11:22:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E162761095; Mon, 13 Dec 2021 16:22:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC50B60C9F;
	Mon, 13 Dec 2021 16:22:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <599331.1639410068@warthog.procyon.org.uk>
References: <599331.1639410068@warthog.procyon.org.uk>
	<CALF+zOnmJ0=j8pEMikpxYgLrS10gVZiXfCjBhDz9Je0Qip7wnw@mail.gmail.com>
	<163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<CALF+zOnA2U6LjDTE8m2REDTMmFVnWkcBkn0ZJQRGULPUjeQW4Q@mail.gmail.com>
MIME-Version: 1.0
Date: Mon, 13 Dec 2021 16:22:55 +0000
Message-ID: <604661.1639412575@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BDGMuVd015748
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH] fscache: Need to go round again after
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <604660.1639412575.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> However, if both LRU discard and relinquishment happen *before* the SM
> runs, one of the queue events will get discarded, along with the ref that
> would be associated with it.  The last ref is then discarded and the cookie
> is removed without completing the relinquishment process - leaving the
> cookie hashed.

This can be seen in a trace, e.g.:

  kworker/u16:97-5939    [000] .....   639.403740: fscache_cookie: c=000071a9 -   lrudo r=3
  kworker/u16:97-5939    [000] .....   639.403741: fscache_cookie: c=000071a9 GQ  endac r=4
  kworker/u16:97-5939    [000] .....   639.403745: fscache_cookie: c=000071a9 PUT lru   r=3
       dirstress-7027    [002] .....   639.427220: fscache_relinquish: c=000071a9 V=00000001 r=3 U=0 f=bd rt=0
       dirstress-7027    [002] .....   639.427222: fscache_cookie: c=000071a9 GQ  endac r=4
       dirstress-7027    [002] .....   639.427223: fscache_cookie: c=000071a9 PQ  overq r=3

where the "overq" line marks the discarded event and ref.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

