Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B7F693F609A
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 Aug 2021 16:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629815949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g6ckHkDUDuEIvaPyB9JiG+mAyT7k6/DiSt6VbqvdgbE=;
	b=UWijVvM2t7cmTNiaDpRu9HSBO0SpHiqpB/RrnSxFe6DJOeZSBYcUk1ZInNowPfo9EEs6+q
	uCQsJeSlQ/92cMmQafyiXNW7K0MulWZQbRpPx3P8nAjbTHFclLo/6B477hvQwUFtDBJ9Oc
	D5O5MorSfszMNcSIylTQ+Lk9OKyWJo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-LVjB-2TAMAW6yfxFf3eO-w-1; Tue, 24 Aug 2021 10:39:08 -0400
X-MC-Unique: LVjB-2TAMAW6yfxFf3eO-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6568799ED;
	Tue, 24 Aug 2021 14:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 077E91017CE7;
	Tue, 24 Aug 2021 14:39:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B6A1181A0F8;
	Tue, 24 Aug 2021 14:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OEd1UG005081 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 10:39:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8CE6100EB3D; Tue, 24 Aug 2021 14:39:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 697AD1036D27;
	Tue, 24 Aug 2021 14:38:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YST/0e92OdSH0zjg@casper.infradead.org>
References: <YST/0e92OdSH0zjg@casper.infradead.org>
	<162981147473.1901565.1455657509200944265.stgit@warthog.procyon.org.uk>
	<162981148752.1901565.3663780601682206026.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 24 Aug 2021 15:38:55 +0100
Message-ID: <1953537.1629815935@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Jeffrey Altman <jaltman@auristor.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	v9fs-developer@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] [PATCH 1/6] afs: Fix afs_launder_page() to set
	correct start file position
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1953536.1629815935.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> 
> This could be page_offset(page), which reads better to me:
> 
> 		ret = afs_store_data(vnode, &iter, page_offset(page) + f, true);

True.  It gets converted to folio_pos() in patch #5 - will that do?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

