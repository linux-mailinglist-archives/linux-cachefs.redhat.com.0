Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E7FD140BADA
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Sep 2021 23:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631656772;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uh1rLbui8686sYKRwEGQkS+BmIKzZUlEPsIIu1JKHiU=;
	b=OnMnpd3UXLbgqhv8ZZHweBE6rjAZgSYUx7U4l/iJKxSV6FpvU/77tD1YkHys5Lfh1np8dC
	pr0ut8jrEIvetmZHsxgZm9InnELyynLbuQvq+A1jRTXj2GmrvQS1Yah2MsQn0szHYxm2XH
	3CnobFpldf4VKKKLFK7NiWF1JRtqA9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-xVF2Nnf1MpuAT88-tPT9Fw-1; Tue, 14 Sep 2021 17:59:31 -0400
X-MC-Unique: xVF2Nnf1MpuAT88-tPT9Fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31C05189CD39;
	Tue, 14 Sep 2021 21:59:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AFC65D6AD;
	Tue, 14 Sep 2021 21:59:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90FC81809C84;
	Tue, 14 Sep 2021 21:59:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ELxK3T028586 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 14 Sep 2021 17:59:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0F26196E2; Tue, 14 Sep 2021 21:59:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27B141972D;
	Tue, 14 Sep 2021 21:59:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YUEZXktGOCUWfvnU@codewreck.org>
References: <YUEZXktGOCUWfvnU@codewreck.org>
	<6274f0922aecd9b40dd7ff1ef007442ed996aed7.camel@redhat.com>
	<163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
	<163162772646.438332.16323773205855053535.stgit@warthog.procyon.org.uk>
	<439558.1631628579@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
MIME-Version: 1.0
Date: Tue, 14 Sep 2021 22:59:12 +0100
Message-ID: <746601.1631656752@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 4/8] 9p: (untested) Convert to using the
	netfs helper lib to do reads and caching
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
Content-ID: <746600.1631656752.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dominique Martinet <asmadeus@codewreck.org> wrote:

> Agreed with the merge window passed it'll be for next one -- but I'd
> like this to sit in -next for as long as possible, so I'd appreciate
> either being able to carry the patch in my tree (difficult as then
> you'll need to base yourself on mine) or you putting it in there somehow
> after I've got the most basic tests verified again (do you have a branch
> pulled for linux-next?)

I can put it into my fscache-next branch.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

