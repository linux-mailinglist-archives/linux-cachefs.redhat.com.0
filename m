Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B846BCAC
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 14:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638883946;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+HGyl0cM61qa9wEsbGmMRlFyKOso0TwnlS9TFPUMt00=;
	b=g32vOto50t3g21mP7Z63hwKA3O3XR5Xv6CKck+Ww0PZ3ekrwnRmH76/lHu5NXFgQhLPPCR
	ifDOIZfaWdgSj6u9U9L7ao9gwYvfpMgP5bYdyXYxLPpL1yq0g4Dja03ElSfPHPzsMUBQei
	Jic3EFTmi2KG5YgRVaDgudW5av7GqHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-ehJGWX9sMXavuwlgQQsUYA-1; Tue, 07 Dec 2021 08:32:23 -0500
X-MC-Unique: ehJGWX9sMXavuwlgQQsUYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B42A802C8F;
	Tue,  7 Dec 2021 13:32:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 540D31B5B7;
	Tue,  7 Dec 2021 13:32:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A0144BB7C;
	Tue,  7 Dec 2021 13:32:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B7DWGxR011226 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 7 Dec 2021 08:32:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C7DA22719; Tue,  7 Dec 2021 13:32:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACC5B60843;
	Tue,  7 Dec 2021 13:32:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Ya9eDiFCE2fO7K/S@casper.infradead.org>
References: <Ya9eDiFCE2fO7K/S@casper.infradead.org>
	<163887597541.1596626.2668163316598972956.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 07 Dec 2021 13:32:13 +0000
Message-ID: <1602527.1638883933@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B7DWGxR011226
X-loop: linux-cachefs@redhat.com
Cc: jack@suse.cz, jlayton@kernel.org, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Fix lockdep warning from taking
	sb_writers whilst holding mmap_lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1602526.1638883933.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Tue, Dec 07, 2021 at 11:19:35AM +0000, David Howells wrote:
> > Taking sb_writers whilst holding mmap_lock isn't allowed and will result in
> > a lockdep warning like that below.  The problem comes from cachefiles
> > needing to take the sb_writers lock in order to do a write to the cache,
> > but being asked to do this by netfslib called from readpage, readahead or
> > write_begin[1].
> 
> Isn't it taking sb_writers _on a different filesystem_?  So there's not
> a real deadlock here, just a need to tell lockdep that this is a
> different subclass of lock?

Jann thinks it can be turned into a real deadlock.  See the link I put in the
patch description:

> > Link: https://lore.kernel.org/r/20210922110420.GA21576@quack2.suse.cz/ [1]

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

