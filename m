Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6976461ABD
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 16:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638199439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8ZiR9/4IyAZXXxkG6sJTDzFHbLKL5I+a0raK7Pbd2rA=;
	b=UC/tdhPG8dImQbPE2V0zGnIxp+eANkAXFFPad9SmfLqiG7Yp4QDWp0p+0WFKfj+w8diq4C
	VqDl3zVHpm2UW/mGKvJf3286LGir2ftxVu5b497JnE3Hnyi6KzErbt24lf6L1NSk2s2psa
	4Ie+m4orCX4xKBcXsaJDrWd6nJhAnjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-432-9YjYETTTMlqHmgNSWAQwsw-1; Mon, 29 Nov 2021 10:23:56 -0500
X-MC-Unique: 9YjYETTTMlqHmgNSWAQwsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9D519253CC;
	Mon, 29 Nov 2021 15:23:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD7B960BF1;
	Mon, 29 Nov 2021 15:23:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D35F31809C8A;
	Mon, 29 Nov 2021 15:23:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATFNk4h009588 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 10:23:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CE8C85E275; Mon, 29 Nov 2021 15:23:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3185DF4F;
	Mon, 29 Nov 2021 15:23:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2cfdbfd834bb6ff1f7f5cf47e3ea72449fe683b6.camel@redhat.com>
References: <2cfdbfd834bb6ff1f7f5cf47e3ea72449fe683b6.camel@redhat.com>
	<163706992597.3179783.18360472879717076435.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@redhat.com>
MIME-Version: 1.0
Date: Mon, 29 Nov 2021 15:23:34 +0000
Message-ID: <223020.1638199414@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Adjust docs after foliation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <223019.1638199414.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@redhat.com> wrote:

> > -/**
> > - * netfs_skip_folio_read - prep a folio for writing without reading first
> > +/*
> ...
> Not sure why you decided to change the last one not to be a kerneldoc
> comment, but OK. The rest of the changes look straightforward.

It's not part of the API.  It's only internal.  None of the other internal
functions are listed in the API reference.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

