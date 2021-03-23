Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A155A3466C3
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 18:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616521865;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=01JGszx/cdSqA1KHYNvjT5/q2eWI7UunVradTqhn9LA=;
	b=QhfjE/1WU+knbNRaTFuWKv1O5omd0uJjKYrdEHBTSBcra56WcZAra3D9Sw5xj/1UfSCfWl
	XqV0msGCAxCNlHAyuYSHjoVoRgHcyUSWSyexzfBM09MBgC9BnCRCPXl0txZaiADgqM8k9r
	05qw75+2tQxtRXg4iVmPHibINJxSARw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-a6BcbiXVN16AWBWISpp8xA-1; Tue, 23 Mar 2021 13:51:04 -0400
X-MC-Unique: a6BcbiXVN16AWBWISpp8xA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D27B1922961;
	Tue, 23 Mar 2021 17:51:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E5135D6AD;
	Tue, 23 Mar 2021 17:50:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4E251809C82;
	Tue, 23 Mar 2021 17:50:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NHotPv030875 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 13:50:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C7F52BFE9; Tue, 23 Mar 2021 17:50:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C517C6E6FB;
	Tue, 23 Mar 2021 17:50:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YFja/LRC1NI6quL6@cmpxchg.org>
References: <YFja/LRC1NI6quL6@cmpxchg.org>
	<20210320054104.1300774-1-willy@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
MIME-Version: 1.0
Date: Tue, 23 Mar 2021 17:50:31 +0000
Message-ID: <2749829.1616521831@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v5 00/27] Memory Folios
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
Content-ID: <2749828.1616521831.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Johannes Weiner <hannes@cmpxchg.org> wrote:

> So I fully agree with the motivation behind this patch. But I do
> wonder why it's special-casing the commmon case instead of the rare
> case. It comes at a huge cost. Short term, the churn of replacing
> 'page' with 'folio' in pretty much all instances is enormous.
> 
> And longer term, I'm not convinced folio is the abstraction we want
> throughout the kernel. If nobody should be dealing with tail pages in
> the first place, why are we making everybody think in 'folios'? Why
> does a filesystem care that huge pages are composed of multiple base
> pages internally? This feels like an implementation detail leaking out
> of the MM code. The vast majority of places should be thinking 'page'
> with a size of 'page_size()'. Including most parts of the MM itself.

I like the idea of logically separating individual hardware pages from
abstract bundles of pages by using a separate type for them - at least in
filesystem code.  I'm trying to abstract some of the handling out of the
network filesystems and into a common library plus ITER_XARRAY to insulate
those filesystems from the VM.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

