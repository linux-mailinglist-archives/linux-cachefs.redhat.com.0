Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6C2343CBA
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Mar 2021 10:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616405257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tr9B6T3wT9BDDf1jR2Ye6t07L7QnTMkSLgBeMmGaLNw=;
	b=bEOsjDdk58IBrSdHQJd2YNpGkhh/EynSezoEN2298N4L0MEQGb9PD0e+Q6faQHEaFrxxyE
	R8wUeQgoLRbySYs1XadjIgqrBYi4s0W7LGH/N/Pp3pEh+WPyVzbwSatvHBRNlLd6DDYKe4
	2MyjpsKlMnVa5H1xTpSq5uQDRZ3fE1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-BKJnuJr5OF2g_vijnOSA8g-1; Mon, 22 Mar 2021 05:27:35 -0400
X-MC-Unique: BKJnuJr5OF2g_vijnOSA8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62A91881283;
	Mon, 22 Mar 2021 09:27:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52A3354478;
	Mon, 22 Mar 2021 09:27:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31AD94BB7C;
	Mon, 22 Mar 2021 09:27:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12M9RVXJ028629 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 22 Mar 2021 05:27:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70D577086D; Mon, 22 Mar 2021 09:27:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1518F6A03C;
	Mon, 22 Mar 2021 09:27:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210320054104.1300774-4-willy@infradead.org>
References: <20210320054104.1300774-4-willy@infradead.org>
	<20210320054104.1300774-1-willy@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 09:27:26 +0000
Message-ID: <1878264.1616405246@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v5 03/27] afs: Use
	wait_on_page_writeback_killable
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
Content-ID: <1878263.1616405246.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox (Oracle) <willy@infradead.org> wrote:

> Open-coding this function meant it missed out on the recent bugfix
> for waiters being woken by a delayed wake event from a previous
> instantiation of the page.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-and-tested-by: David Howells <dhowells@redhat.com>

Should this be pushed upstream now as well if it's missing out on a bugfix?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

