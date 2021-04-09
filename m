Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2719035A292
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 18:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617984270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WISsJtUbh8xY34d1bHVa2wKKImUYFls0QufjgGRrdHs=;
	b=OjDj7fRGSKQy8IToV++qaLjXD4a4aZOaz2zt51yvjgOs0k4UWtqj6Wc6xFsp+ddHjZbrLv
	FewYQ3B0fuKOAQqx2Gq/c8sSsASOFj9gI/JqlAT+HtoX6EgL5uA9ycZ/yQMn8JJ2IvZJKf
	T+4uHiIWH2zepIhR6o1M7+Dp2ARawys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-zxTf8rZ2OJOATttAx9_kuQ-1; Fri, 09 Apr 2021 12:03:58 -0400
X-MC-Unique: zxTf8rZ2OJOATttAx9_kuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B76C31883520;
	Fri,  9 Apr 2021 16:03:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D515C5D6AB;
	Fri,  9 Apr 2021 16:03:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5AF31806D0E;
	Fri,  9 Apr 2021 16:03:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139G3mQI000331 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 12:03:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 531C15C3E0; Fri,  9 Apr 2021 16:03:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E36435C1D5;
	Fri,  9 Apr 2021 16:03:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <625171.1617971734@warthog.procyon.org.uk>
References: <625171.1617971734@warthog.procyon.org.uk>
	<20210409111636.GR2531743@casper.infradead.org>
	<CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
	<161796595714.350846.1547688999823745763.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 17:03:38 +0100
Message-ID: <838190.1617984218@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, jlayton@kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>,
	torvalds@linux-foundation.org, hch@lst.de
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] mm: Return bool from pagebit
	test functions
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <838189.1617984218.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> add/remove: 2/2 grow/shrink: 15/16 up/down: 408/-599 (-191)
> Function                                     old     new   delta
> iomap_write_end_inline                         -     128    +128

I can get rid of the iomap_write_end_inline() increase for my config by
marking it __always_inline, thereby getting:

add/remove: 1/2 grow/shrink: 15/15 up/down: 280/-530 (-250)

It seems that the decision whether or not to inline iomap_write_end_inline()
is affected by the switch to bool.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

