Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5971F2AC083
	for <lists+linux-cachefs@lfdr.de>; Mon,  9 Nov 2020 17:09:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-XRlQxhaXNOaFDKeqzHMWsQ-1; Mon, 09 Nov 2020 11:09:20 -0500
X-MC-Unique: XRlQxhaXNOaFDKeqzHMWsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D5C58C8987;
	Mon,  9 Nov 2020 16:09:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3849A76642;
	Mon,  9 Nov 2020 16:09:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5059FCF5F;
	Mon,  9 Nov 2020 16:09:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A9G98Ma012190 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 9 Nov 2020 11:09:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 171F71111A57; Mon,  9 Nov 2020 16:09:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 124421006170
	for <linux-cachefs@redhat.com>; Mon,  9 Nov 2020 16:09:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACD93102F1EF
	for <linux-cachefs@redhat.com>; Mon,  9 Nov 2020 16:09:05 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-153-zplzZX6mNzq5KRkUeN3_Aw-1;
	Mon, 09 Nov 2020 11:09:02 -0500
X-MC-Unique: zplzZX6mNzq5KRkUeN3_Aw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id A5203410D; Mon,  9 Nov 2020 11:02:56 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org A5203410D
Date: Mon, 9 Nov 2020 11:02:56 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201109160256.GB11144@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 21, 2020 at 10:33:52AM +0100, Daire Byrne wrote:
> Trond has posted some (v3) patches to emulate lookupp for NFSv3 (a million thanks!) so I applied them to v5.9.1 and ran some more tests using that on the re-export server. Again, I just pathologically dropped inode & dentry caches every second on the re-export server (vfs_cache_pressure=100) while a client looped through some application loading tests.
> 
> Now for every combination of re-export (NFSv3 -> NFSv4.x or NFSv4.x -> NFSv3), I no longer see any stale file handles (/proc/net/rpc/nfsd) when dropping inode & dentry caches (yay!).
> 
> However, my assumption that some of the input/output errors I was seeing were related to the estales seems to have been misguided. After running these tests again without any estales, it now looks like a different issue that is unique to re-exporting NFSv3 from an NFSv4.0 originating server (either Linux or Netapp). The lookups are all fine (no estale) but reading some files eventually gives an input/output error on multiple clients which remain consistent until the re-export nfs-server is restarted. Again, this only occurs while dropping inode + dentry caches.
> 
> So in summary, while continuously dropping inode/dentry caches on the re-export server:

How continuously, exactly?

I recall that there are some situations where the best the client can do
to handle an ESTALE is just retry.  And that our code generally just
retries once and then gives up.

I wonder if it's possible that the client or re-export server can get
stuck in a situation where they can't guarantee forward progress in the
face of repeated ESTALEs.  I don't have a specific case in mind, though.

--b.

> 
> originating server NFSv4.x -> NFSv4.x re-export server = good (no estale, no input/output errors)
> originating server NFSv4.1/4.2 -> NFSv3 re-export server = good
> originating server NFSv4.0 -> NFSv3 re-export server = no estale but lots of input/output errors
> originating server NFSv3 -> NFSv3 re-export server = good (fixed by Trond's lookupp emulation patches)
> originating server NFSv3 -> NFSv4.x re-export server = good (fixed by Trond's lookupp emulation patches)
> 
> In our case, we are stuck with some old 7-mode Netapps so we only have two mount choices, NFSv3 or NFSv4.0 (hence our particular interest in the NFSv4.0 re-export behaviour). And as discussed previously, a re-export of an NFSv3 server requires my horrible hack in order to avoid excessive lookups and client cache invalidations.
> 
> But these lookupp emulation patches fix the ESTALEs for the NFSv3 re-export cases, so many thanks again for that Trond. When re-exporting an NFSv3 client mount, we no longer need to change vfs_cache_pressure=0.
> 
> Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

