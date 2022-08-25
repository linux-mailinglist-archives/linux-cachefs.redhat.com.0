Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D84455A15C9
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 17:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661441467;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SRHX7zjfsK8DG/eCCv4z/fsGOD1VxNRHtrloCkH++Y4=;
	b=FJWeAaAMtFtbGumO3XgsnNZWuwUET4jXZlCPXJa8/HFpSWxU5Drs6+SyeyV4FZ+SG9Y1tv
	9ExKJZoKo/6f47bHSrhD0J7dWELZDzmBGzvTzLDNoPAa0Bhu8xJEowb5hFPuvBLRcw14M7
	hlqdZqFyPoxSIBp8yZLvONyN84eZj4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-ho9lYWKhO_eTnyNWa45d9Q-1; Thu, 25 Aug 2022 11:31:03 -0400
X-MC-Unique: ho9lYWKhO_eTnyNWa45d9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC08F804191;
	Thu, 25 Aug 2022 15:31:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1EED40C141D;
	Thu, 25 Aug 2022 15:31:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D03F1946A5E;
	Thu, 25 Aug 2022 15:31:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE64C1946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 15:30:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DEDF74010D45; Thu, 25 Aug 2022 15:30:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0AF24010FA0;
 Thu, 25 Aug 2022 15:30:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YweOySTkKQ3PDLCv@casper.infradead.org>
References: <YweOySTkKQ3PDLCv@casper.infradead.org>
 <da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com>
 <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
 <216681.1661350326@warthog.procyon.org.uk>
 <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
 <YwZXfSXMzZgaSPAg@casper.infradead.org>
 <5dfadceb26da1b4d8d499221a5ff1d3c80ad59c0.camel@hammerspace.com>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 25 Aug 2022 16:30:58 +0100
Message-ID: <3965611.1661441458@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] NFS: Add support for netfs in
 struct nfs_inode and Kconfig
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3965610.1661441458.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> AFS tracks one dirty range per folio, but it first brings the folio uptodate
> by reading it from the server before overwriting it (I suppose that's a
> fourth option).

I'm intending on moving afs towards the nfs way of doing things when writing
to as-yet unread folios - unless a cache is in operation, then we read it
anyway and store the folio(s) into the cache unless the entire cache granule
is going to be overwritten unless we're supporting disconnected mode.  I know
that's exceptions-to-exceptions.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

