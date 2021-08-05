Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 831F03E2876
	for <lists+linux-cachefs@lfdr.de>; Fri,  6 Aug 2021 12:20:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-qXZ9c4f6PxeLbfEWhleeIQ-1; Fri, 06 Aug 2021 06:20:31 -0400
X-MC-Unique: qXZ9c4f6PxeLbfEWhleeIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78031007463;
	Fri,  6 Aug 2021 10:20:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3464269CBA;
	Fri,  6 Aug 2021 10:20:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B71ED4BB7C;
	Fri,  6 Aug 2021 10:20:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175IRvrJ014577 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 14:27:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0BAA7113B40; Thu,  5 Aug 2021 18:27:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0616610728D
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 18:27:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 507C996B06F
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 18:27:53 +0000 (UTC)
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-529-jbbkuRqvO7unFNK4lfpM_A-1; Thu, 05 Aug 2021 14:27:51 -0400
X-MC-Unique: jbbkuRqvO7unFNK4lfpM_A-1
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
	(envelope-from <kilobyte@angband.pl>)
	id 1mBhYA-001pwx-6C; Thu, 05 Aug 2021 19:52:58 +0200
Date: Thu, 5 Aug 2021 19:52:58 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: David Howells <dhowells@redhat.com>
Message-ID: <YQwlehFilahEZg2T@angband.pl>
References: <YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1219713.1628181333@warthog.procyon.org.uk>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 06 Aug 2021 06:20:22 -0400
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-afs@lists.infradead.org,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] Canvassing for network filesystem write size vs
	page size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBBdWcgMDUsIDIwMjEgYXQgMDU6MzU6MzNQTSArMDEwMCwgRGF2aWQgSG93ZWxscyB3
cm90ZToKPiAgLSBhIGNvbXBsZXRlIGZvbGlvIGN1cnJlbnRseSBpcyBsaW1pdGVkIHRvIFBNRF9T
SVpFIG9yIG9yZGVyIDgsIGJ1dCBjb3VsZAo+ICAgIHRoZW9yZXRpY2FsbHkgZ28gdXAgdG8gYWJv
dXQgMkdpQiBiZWZvcmUgdmFyaW91cyBpbnRlZ2VyIGZpZWxkcyBoYXZlIHRvIGJlCj4gICAgbW9k
aWZpZWQgKG5vdCB0byBtZW50aW9uIHRoZSBtZW1vcnkgYWxsb2NhdG9yKS4KCk5vIHN1cHBvcnQg
Zm9yIHJpc2N2IDUxMkdCIHBhZ2VzPyA6cAoKCi0tIAriooDio7TioL7ioLviorbio6bioIAK4qO+
4qCB4qKg4qCS4qCA4qO/4qGBIFRoZSBpbGwtdGhvdWdodCBjb252ZXJzaW9uIHRvIHRpbWU2NF90
IHdpbGwgbWFrZSB1cyBzdWZmZXIgZnJvbQrior/ioYTioJjioLfioJrioIvioIAgdGhlIFkyOTJC
IHByb2JsZW0uICBTbyBsZXQncyBtb3ZlIHRoZSBFcG9jaCBieSA0MzU0NTE0MDAwNjQwMDAwMDAK
4qCI4qCz4qOE4qCA4qCA4qCA4qCAIGFuZCBtYWtlIGl0IHVuc2lnbmVkIC0tIHRoYXQnbGwgYWxt
b3N0IGRvdWJsZSB0aGUgcmFuZ2UuCgotLQpMaW51eC1jYWNoZWZzIG1haWxpbmcgbGlzdApMaW51
eC1jYWNoZWZzQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1jYWNoZWZz

