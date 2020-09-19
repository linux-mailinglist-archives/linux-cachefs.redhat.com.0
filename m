Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28945270D76
	for <lists+linux-cachefs@lfdr.de>; Sat, 19 Sep 2020 13:08:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-hSV4HqXQMXSpRT07Hc7bwQ-1; Sat, 19 Sep 2020 07:08:47 -0400
X-MC-Unique: hSV4HqXQMXSpRT07Hc7bwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 691B756BF5;
	Sat, 19 Sep 2020 11:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A958A5C64D;
	Sat, 19 Sep 2020 11:08:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C20D183D046;
	Sat, 19 Sep 2020 11:08:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08JB8YPc001608 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 19 Sep 2020 07:08:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9ADD0109EF65; Sat, 19 Sep 2020 11:08:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95038109EF63
	for <linux-cachefs@redhat.com>; Sat, 19 Sep 2020 11:08:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4965386CFED
	for <linux-cachefs@redhat.com>; Sat, 19 Sep 2020 11:08:32 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-11-rEJdUBCePAKKAsBzhozGCw-1; 
	Sat, 19 Sep 2020 07:08:29 -0400
X-MC-Unique: rEJdUBCePAKKAsBzhozGCw-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id C4CCA1D7D5FB;
	Sat, 19 Sep 2020 12:08:27 +0100 (BST)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4btvWuSo5uF1; Sat, 19 Sep 2020 12:08:27 +0100 (BST)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 9D9A21D7D5D5;
	Sat, 19 Sep 2020 12:08:27 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id BBA73826AA9C;
	Sat, 19 Sep 2020 12:08:23 +0100 (BST)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id CYc1nayDwO9A; Sat, 19 Sep 2020 12:08:23 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id A0DB3831F92D;
	Sat, 19 Sep 2020 12:08:23 +0100 (BST)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1OiEi2AI0dWA; Sat, 19 Sep 2020 12:08:23 +0100 (BST)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 617BF826AA9C;
	Sat, 19 Sep 2020 12:08:23 +0100 (BST)
Date: Sat, 19 Sep 2020 12:08:26 +0100 (BST)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <427784057.40882901.1600513706581.JavaMail.zimbra@dneg.com>
In-Reply-To: <20200917215729.GA18980@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
	<20200917190931.GA6858@fieldses.org>
	<20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<20200917215729.GA18980@fieldses.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: Dne055AM7RY0WXsKN8UYB1awgeuonw==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Frank van der Linden <fllinden@amazon.com>,
	linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 17 Sep, 2020, at 22:57, bfields bfields@fieldses.org wrote:

> On Thu, Sep 17, 2020 at 08:23:03PM +0000, Frank van der Linden wrote:
>> On Thu, Sep 17, 2020 at 03:09:31PM -0400, bfields wrote:
>> > 
>> > On Thu, Sep 17, 2020 at 05:01:11PM +0100, Daire Byrne wrote:
>> > >
>> > > ----- On 15 Sep, 2020, at 18:21, bfields bfields@fieldses.org wrote:
>> > >
>> > > >> 4) With an NFSv4 re-export, lots of open/close requests (hundreds per
>> > > >> second) quickly eat up the CPU on the re-export server and perf top
>> > > >> shows we are mostly in native_queued_spin_lock_slowpath.
>> > > >
>> > > > Any statistics on who's calling that function?
>> > >
>> > > With just 40 clients mounting the reexport server (v5.7.6) using NFSv4.2, we see
>> > > the CPU of the nfsd threads increase rapidly and by the time we have 100
>> > > clients, we have maxed out the 32 cores of the server with most of that in
>> > > native_queued_spin_lock_slowpath.
>> > 
>> > That sounds a lot like what Frank Van der Linden reported:
>> > 
>> >         https://lore.kernel.org/linux-nfs/20200608192122.GA19171@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com/
>> > 
>> > It looks like a bug in the filehandle caching code.
>> > 
>> > --b.
>> 
>> Yes, that does look like the same one.
>> 
>> I still think that not caching v4 files at all may be the best way to go
>> here, since the intent of the filecache code was to speed up v2/v3 I/O,
>> where you end up doing a lot of opens/closes, but it doesn't make as
>> much sense for v4.
>> 
>> However, short of that, I tested a local patch a few months back, that
>> I never posted here, so I'll do so now. It just makes v4 opens in to
>> 'long term' opens, which do not get put on the LRU, since that doesn't
>> make sense (they are in the hash table, so they are still cached).
> 
> That makes sense to me.  But I'm also not opposed to turning it off for
> v4 at this point.
> 
> --b.

Thank you both, that's absolutely the issue with our (broken) production workload. I totally missed that thread while researching the archives.

I tried both of Frank's patches and the CPU returned to normal levels, native_queued_spin_lock_slowpath went from 88% to 2% usage and the server performed pretty much the same as it does for an NFSv3 export.

So, ultimately this had nothing to do with NFS re-exporting; it's just that I was using a newer kernel with filecache to do it. All our other NFSv4 originating servers are running older kernels, hence why our (broken) workload never caused us any problems before. Thanks for clearing that up for me.

With regards to dropping the filecache feature completely for NFSv4, I do wonder if it does still save a few precious network round-trips (which is especially important for my re-export scenario)? We want to be able to choose the level of caching on the re-export server and minimise expensive lookups to originating servers that may be many milliseconds away (coherency be damned).

Seeing as there was some interest in issue #1 (drop caches = estale re-exports) and this #4 issue (NFSv4 filecache vs ridiculous open/close counts), I'll post some more detail & reproducers next week for #2 (invalidating the re-export server's NFS client cache) and #3 (cached client metadata lookups not returned quickly enough when the client is busy with reads).

That way anyone trying to follow in my (re-exporting) footsteps is fully aware of all the potential performance pitfalls I have discovered so far.

Many thanks,

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

