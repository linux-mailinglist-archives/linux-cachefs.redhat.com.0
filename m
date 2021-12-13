Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F804737B4
	for <lists+linux-cachefs@lfdr.de>; Mon, 13 Dec 2021 23:39:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639435190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HAK83IJM+ZSDnyuuU9Tr/fGInIiafwUTKXt8Xx639/I=;
	b=TBabRDOFpF1XTw+v9BXJuyQA4PcYJGk1kL0MkgyipXtu3bAYfUQVbNr6jY9zN4vshvU796
	zDb1BTlRz8VeP+N7SahU4q+Y5pFkT5M/RMh5vqa8JE6D0AtiVaoIhL+9UWprNYSMqpV51G
	ug9iTvrrZLiHS7xqJG2J+qqG9fHJLsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-8C0QzUCQMNu8w4LPnyHjnQ-1; Mon, 13 Dec 2021 17:39:47 -0500
X-MC-Unique: 8C0QzUCQMNu8w4LPnyHjnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E59A0801B31;
	Mon, 13 Dec 2021 22:39:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F17B1972E;
	Mon, 13 Dec 2021 22:39:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AAE64BB7C;
	Mon, 13 Dec 2021 22:39:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BDMdZdx028051 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 13 Dec 2021 17:39:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 572E5226E8; Mon, 13 Dec 2021 22:39:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D136779D6;
	Mon, 13 Dec 2021 22:39:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <629803.1639425799@warthog.procyon.org.uk>
References: <629803.1639425799@warthog.procyon.org.uk>
	<599331.1639410068@warthog.procyon.org.uk>
	<CALF+zOnmJ0=j8pEMikpxYgLrS10gVZiXfCjBhDz9Je0Qip7wnw@mail.gmail.com>
	<163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<CALF+zOnA2U6LjDTE8m2REDTMmFVnWkcBkn0ZJQRGULPUjeQW4Q@mail.gmail.com>
MIME-Version: 1.0
Date: Mon, 13 Dec 2021 22:39:26 +0000
Message-ID: <686220.1639435166@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <686219.1639435166.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> I forgot to commit part of the patch.  Attached is the patch in full.

Sigh.  I replied to the wrong message.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

