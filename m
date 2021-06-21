Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76B063AEB60
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 16:33:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-2fHfm-RwP1yqrV3TjMu3cg-1; Mon, 21 Jun 2021 10:33:50 -0400
X-MC-Unique: 2fHfm-RwP1yqrV3TjMu3cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5CB804145;
	Mon, 21 Jun 2021 14:33:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D457878C00;
	Mon, 21 Jun 2021 14:33:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 983164EA29;
	Mon, 21 Jun 2021 14:33:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LEXch6024817 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 10:33:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59896112C08C; Mon, 21 Jun 2021 14:33:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54BE01000DA7
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 14:33:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B943C858286
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 14:33:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-543-mpdPm-85PIqI5ySG5beb7g-1; Mon, 21 Jun 2021 10:33:32 -0400
X-MC-Unique: mpdPm-85PIqI5ySG5beb7g-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lvKyj-00DBPp-0L; Mon, 21 Jun 2021 14:32:56 +0000
Date: Mon, 21 Jun 2021 15:32:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YNCjDGXGfewvl8E0@casper.infradead.org>
References: <162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk>
	<162391824293.1173366.15452474691364794223.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <162391824293.1173366.15452474691364794223.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v2 1/3] afs: Handle len being extending
 over page end in write_begin/write_end
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 17, 2021 at 09:24:02AM +0100, David Howells wrote:
> With transparent huge pages, in the future, write_begin() and write_end()
> may be passed a length parameter that, in combination with the offset into
> the page, exceeds the length of that page.  This allows
> grab_cache_page_write_begin() to better choose the size of THP to allocate.

While this is all true, it's really not necessary at this point in time.
That change will come with a conversion of these functions to work with
folios and basically every line you change here will change again.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

