Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 633702B05C2
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Nov 2020 14:02:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-9vwtVY14MiSj1GgyaxZaRg-1; Thu, 12 Nov 2020 08:02:27 -0500
X-MC-Unique: 9vwtVY14MiSj1GgyaxZaRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABBA580364D;
	Thu, 12 Nov 2020 13:02:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D08778801;
	Thu, 12 Nov 2020 13:02:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0859180B658;
	Thu, 12 Nov 2020 13:02:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACD2He3007934 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 08:02:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A7732156A4D; Thu, 12 Nov 2020 13:02:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04A652156A50
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 13:02:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADF7A85829F
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 13:02:13 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-533-sYyoeyFIPaS0IDFPf1otPQ-1;
	Thu, 12 Nov 2020 08:02:11 -0500
X-MC-Unique: sYyoeyFIPaS0IDFPf1otPQ-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 4CB6E69D097D;
	Thu, 12 Nov 2020 13:02:10 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HxadmVT4_sQN; Thu, 12 Nov 2020 13:02:10 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id 2C7C069DB6F5;
	Thu, 12 Nov 2020 13:02:10 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 1D46A8102E07;
	Thu, 12 Nov 2020 13:02:10 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mN9mhnrtnpXF; Thu, 12 Nov 2020 13:02:10 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 104E8826D69E;
	Thu, 12 Nov 2020 13:01:52 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id baDDNzVZDloS; Thu, 12 Nov 2020 13:01:51 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 6FE08826C9D7;
	Thu, 12 Nov 2020 13:01:24 +0000 (GMT)
Date: Thu, 12 Nov 2020 13:01:24 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
In-Reply-To: <20201109160256.GB11144@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: 9doLxBH184R2kXPXNb1Z3BB0W3rboA==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 9 Nov, 2020, at 16:02, bfields bfields@fieldses.org wrote:
> On Wed, Oct 21, 2020 at 10:33:52AM +0100, Daire Byrne wrote:
>> Trond has posted some (v3) patches to emulate lookupp for NFSv3 (a million
>> thanks!) so I applied them to v5.9.1 and ran some more tests using that on the
>> re-export server. Again, I just pathologically dropped inode & dentry caches
>> every second on the re-export server (vfs_cache_pressure=100) while a client
>> looped through some application loading tests.
>> 
>> Now for every combination of re-export (NFSv3 -> NFSv4.x or NFSv4.x -> NFSv3), I
>> no longer see any stale file handles (/proc/net/rpc/nfsd) when dropping inode &
>> dentry caches (yay!).
>> 
>> However, my assumption that some of the input/output errors I was seeing were
>> related to the estales seems to have been misguided. After running these tests
>> again without any estales, it now looks like a different issue that is unique
>> to re-exporting NFSv3 from an NFSv4.0 originating server (either Linux or
>> Netapp). The lookups are all fine (no estale) but reading some files eventually
>> gives an input/output error on multiple clients which remain consistent until
>> the re-export nfs-server is restarted. Again, this only occurs while dropping
>> inode + dentry caches.
>> 
>> So in summary, while continuously dropping inode/dentry caches on the re-export
>> server:
> 
> How continuously, exactly?
> 
> I recall that there are some situations where the best the client can do
> to handle an ESTALE is just retry.  And that our code generally just
> retries once and then gives up.
> 
> I wonder if it's possible that the client or re-export server can get
> stuck in a situation where they can't guarantee forward progress in the
> face of repeated ESTALEs.  I don't have a specific case in mind, though.

I was dropping caches every second in a loop on the NFS re-export server. Meanwhile a large python application that takes ~15 seconds to complete was also looping on a client of the re-export server. So we are clearing out the cache many times such that the same python paths are being re-populated many times.

Having just completed a bunch of fresh cloud rendering with v5.9.1 and Trond's NFSv3 lookupp emulation patches, I can now revise my original list of issues that others will likely experience if they ever try to do this craziness:

1) Don't re-export NFSv4.0 unless you set vfs_cache_presure=0 otherwise you will see random input/output errors on your clients when things are dropped out of the cache. In the end we gave up on using NFSv4.0 with our Netapps because the 7-mode implementation seemed a bit flakey with modern Linux clients (Linux NFSv4.2 servers on the other hand have been rock solid). We now use NFSv3 with Trond's lookupp emulation patches instead.

2) In order to better utilise the re-export server's client cache when re-exporting an NFSv3 server (using either NFSv3 or NFSv4), we still need to use the horrible inode_peek_iversion_raw hack to maintain good metadata performance for large numbers of clients. Otherwise each re-export server's clients can cause invalidation of the re-export server client cache. Once you have hundreds of clients they all combine to constantly invalidate the cache resulting in an order of magnitude slower metadata performance. If you are re-exporting an NFSv4.x server (with either NFSv3 or NFSv4.x) this hack is not required.

3) For some reason, when a 1MB read call arrives at the re-export server from a client, it gets chopped up into 128k read calls that are issued back to the originating server despite rsize/wsize=1MB on all mounts. This results in a noticeable increase in rpc chatter for large reads. Writes on the other hand retain their 1MB size from client to re-export server and back to the originating server. I am using nconnect but I doubt that is related.

4) After some random time, the cachefilesd userspace daemon stops culling old data from an fscache disk storage. I thought it was to do with setting vfs_cache_pressure=0 but even with it set to the default 100 it just randomly decides to stop culling and never comes back to life until restarted or rebooted. Perhaps the fscache/cachefilesd rewrite that David Howells & David Wysochanski have been working on will improve matters.

5) It's still really hard to cache nfs client metadata for any definitive time (actimeo,nocto) due to the pagecache churn that reads cause. If all required metadata (i.e. directory contents) could either be locally cached to disk or the inode cache rather than pagecache then maybe we would have more control over the actual cache times we are comfortable with for our workloads. This has little to do with re-exporting and is just a general NFS performance over the WAN thing. I'm very interested to see how Trond's recent patches to improve readdir performance might at least help re-populate the dropped cached metadata more efficiently over the WAN.

I just want to finish with one more crazy thing we have been doing - a re-export server of a re-export server! Again, a locking and consistency nightmare so only possible for very specific workloads (like ours). The advantage of this topology is that you can pull all your data over the WAN once (e.g. on-premise to cloud) and then fan-out that data to multiple other NFS re-export servers in the cloud to improve the aggregate performance to many clients. This avoids having multiple re-export servers all needing to pull the same data across the WAN.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

