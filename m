Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8872B0732
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Nov 2020 15:02:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-je-frpJZNWSj51t7Mox4NA-1; Thu, 12 Nov 2020 09:02:48 -0500
X-MC-Unique: je-frpJZNWSj51t7Mox4NA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DD6D876E3F;
	Thu, 12 Nov 2020 14:02:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E33555764;
	Thu, 12 Nov 2020 14:02:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 802F6180B657;
	Thu, 12 Nov 2020 14:02:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACDve9C013781 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 08:57:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D5CBEE395; Thu, 12 Nov 2020 13:57:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 452C6F5594
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 13:57:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E477B811E79
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 13:57:37 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-253-NBcpwOFRNjWe_O6pqcn_jw-1;
	Thu, 12 Nov 2020 08:57:35 -0500
X-MC-Unique: NBcpwOFRNjWe_O6pqcn_jw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id A3E73410D; Thu, 12 Nov 2020 08:57:33 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org A3E73410D
Date: Thu, 12 Nov 2020 08:57:33 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201112135733.GA9243@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
	Trond Myklebust <trondmy@hammerspace.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 12, 2020 at 01:01:24PM +0000, Daire Byrne wrote:
> 
> ----- On 9 Nov, 2020, at 16:02, bfields bfields@fieldses.org wrote:
> > On Wed, Oct 21, 2020 at 10:33:52AM +0100, Daire Byrne wrote:
> >> Trond has posted some (v3) patches to emulate lookupp for NFSv3 (a million
> >> thanks!) so I applied them to v5.9.1 and ran some more tests using that on the
> >> re-export server. Again, I just pathologically dropped inode & dentry caches
> >> every second on the re-export server (vfs_cache_pressure=100) while a client
> >> looped through some application loading tests.
> >> 
> >> Now for every combination of re-export (NFSv3 -> NFSv4.x or NFSv4.x -> NFSv3), I
> >> no longer see any stale file handles (/proc/net/rpc/nfsd) when dropping inode &
> >> dentry caches (yay!).
> >> 
> >> However, my assumption that some of the input/output errors I was seeing were
> >> related to the estales seems to have been misguided. After running these tests
> >> again without any estales, it now looks like a different issue that is unique
> >> to re-exporting NFSv3 from an NFSv4.0 originating server (either Linux or
> >> Netapp). The lookups are all fine (no estale) but reading some files eventually
> >> gives an input/output error on multiple clients which remain consistent until
> >> the re-export nfs-server is restarted. Again, this only occurs while dropping
> >> inode + dentry caches.
> >> 
> >> So in summary, while continuously dropping inode/dentry caches on the re-export
> >> server:
> > 
> > How continuously, exactly?
> > 
> > I recall that there are some situations where the best the client can do
> > to handle an ESTALE is just retry.  And that our code generally just
> > retries once and then gives up.
> > 
> > I wonder if it's possible that the client or re-export server can get
> > stuck in a situation where they can't guarantee forward progress in the
> > face of repeated ESTALEs.  I don't have a specific case in mind, though.
> 
> I was dropping caches every second in a loop on the NFS re-export server. Meanwhile a large python application that takes ~15 seconds to complete was also looping on a client of the re-export server. So we are clearing out the cache many times such that the same python paths are being re-populated many times.
> 
> Having just completed a bunch of fresh cloud rendering with v5.9.1 and Trond's NFSv3 lookupp emulation patches, I can now revise my original list of issues that others will likely experience if they ever try to do this craziness:
> 
> 1) Don't re-export NFSv4.0 unless you set vfs_cache_presure=0 otherwise you will see random input/output errors on your clients when things are dropped out of the cache. In the end we gave up on using NFSv4.0 with our Netapps because the 7-mode implementation seemed a bit flakey with modern Linux clients (Linux NFSv4.2 servers on the other hand have been rock solid). We now use NFSv3 with Trond's lookupp emulation patches instead.

So,

		NFSv4.2			  NFSv4.2
	client --------> re-export server -------> original server

works as long as both servers are recent Linux, but when the original
server is Netapp, you need the protocol used in both places to be v3, is
that right?

> 2) In order to better utilise the re-export server's client cache when re-exporting an NFSv3 server (using either NFSv3 or NFSv4), we still need to use the horrible inode_peek_iversion_raw hack to maintain good metadata performance for large numbers of clients. Otherwise each re-export server's clients can cause invalidation of the re-export server client cache. Once you have hundreds of clients they all combine to constantly invalidate the cache resulting in an order of magnitude slower metadata performance. If you are re-exporting an NFSv4.x server (with either NFSv3 or NFSv4.x) this hack is not required.

Have we figured out why that's required, or found a longer-term
solution?  (Apologies, the memory of the earlier conversation is
fading....)

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

