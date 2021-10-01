Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFDF41EFD9
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Oct 2021 16:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633099363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wMARadAsZpdafFVXQx8WtiCaNqJbBY3ywQ1hex9RSZU=;
	b=c2b8fMJyLMtN7GAoWhByOjr/Tv7BB18J1qFuH2hTDHjegvCoAf6lY5jvegTwrlXU2K/QkJ
	VS151RfxZbl9KLXy3dhsajsrC5EjNSP5fEfCZfquFGUMOmgZcqg/2h6eMU1n4+20v1Al81
	MpHPrP0gDAO0a+yw7Iar9e3a04EUWz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-E_mLlsXVPzq4wWEPtkTqhQ-1; Fri, 01 Oct 2021 10:42:38 -0400
X-MC-Unique: E_mLlsXVPzq4wWEPtkTqhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A1F5101F00D;
	Fri,  1 Oct 2021 14:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C3DF5F4F9;
	Fri,  1 Oct 2021 14:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20F5C4E590;
	Fri,  1 Oct 2021 14:42:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191EgXKO018080 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 10:42:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E52DD17B4F; Fri,  1 Oct 2021 14:42:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C9825DA61;
	Fri,  1 Oct 2021 14:42:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
References: <CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
	<163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk>
	<163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
To: David Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Fri, 01 Oct 2021 15:42:31 +0100
Message-ID: <80682.1633099351@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 3/8] nfs: Move to using the alternate
	fallback fscache I/O API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <80681.1633099351.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Wysochanski <dwysocha@redhat.com> wrote:

> The added "if (ret < 0) ..." renders the bulk of the switch statement with
> non-zero cases moot.  I have a patch or two on top of it that cleans this
> up, and replaces the dfprintks with tracepoints.  If you want I can try to
> merge at least bits of it into a v3 of this patch, and leave the dfprintk
> conversion to tracepoints for another patch.

If you can give me the clean up bits, I can fold them in.  I think it's
probably worth keeping the dfprintk conversion separate.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

