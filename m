Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B79B02835F1
	for <lists+linux-cachefs@lfdr.de>; Mon,  5 Oct 2020 14:54:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-r28KfgeKNZmvwwshxHauAg-1; Mon, 05 Oct 2020 08:54:49 -0400
X-MC-Unique: r28KfgeKNZmvwwshxHauAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D700D1018F7A;
	Mon,  5 Oct 2020 12:54:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2548E5C221;
	Mon,  5 Oct 2020 12:54:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4210644A5F;
	Mon,  5 Oct 2020 12:54:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095CsdaG005072 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 08:54:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D62B920235B7; Mon,  5 Oct 2020 12:54:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFE98202451D
	for <linux-cachefs@redhat.com>; Mon,  5 Oct 2020 12:54:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80C01186E143
	for <linux-cachefs@redhat.com>; Mon,  5 Oct 2020 12:54:37 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-394-UzYT5EeoMwOAGURMednmDA-1;
	Mon, 05 Oct 2020 08:54:35 -0400
X-MC-Unique: UzYT5EeoMwOAGURMednmDA-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id CDF7B16F0EE2;
	Mon,  5 Oct 2020 13:54:33 +0100 (BST)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tOXNZCBJWmB4; Mon,  5 Oct 2020 13:54:33 +0100 (BST)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id A9E5516EF899;
	Mon,  5 Oct 2020 13:54:33 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 9A2B78178CC3;
	Mon,  5 Oct 2020 13:54:33 +0100 (BST)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id KO54H1WMuRwe; Mon,  5 Oct 2020 13:54:33 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 7DE758178CAC;
	Mon,  5 Oct 2020 13:54:33 +0100 (BST)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 53AKmjuviyNA; Mon,  5 Oct 2020 13:54:33 +0100 (BST)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 6211B8178CC3;
	Mon,  5 Oct 2020 13:54:33 +0100 (BST)
Date: Mon, 5 Oct 2020 13:54:33 +0100 (BST)
From: Daire Byrne <daire@dneg.com>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <1106572445.58581277.1601902473249.JavaMail.zimbra@dneg.com>
In-Reply-To: <3243730b0661de0ac0864a9bb5375f894b266220.camel@kernel.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<97eff1ee2886c14bcd7972b17330f18ceacdef78.camel@kernel.org>
	<1309604906.55950004.1601510969548.JavaMail.zimbra@dneg.com>
	<3243730b0661de0ac0864a9bb5375f894b266220.camel@kernel.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: SJYUJ1ENNzjjKc9SpmlFRz6CAFOPCQ==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>
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

----- On 1 Oct, 2020, at 11:36, Jeff Layton jlayton@kernel.org wrote:

> On Thu, 2020-10-01 at 01:09 +0100, Daire Byrne wrote:
>> ----- On 30 Sep, 2020, at 20:30, Jeff Layton jlayton@kernel.org wrote:
>> 
>> > On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
>> > > Hi,
>> > > 
>> > > I just thought I'd flesh out the other two issues I have found with re-exporting
>> > > that are ultimately responsible for the biggest performance bottlenecks. And
>> > > both of them revolve around the caching of metadata file lookups in the NFS
>> > > client.
>> > > 
>> > > Especially for the case where we are re-exporting a server many milliseconds
>> > > away (i.e. on-premise -> cloud), we want to be able to control how much the
>> > > client caches metadata and file data so that it's many LAN clients all benefit
>> > > from the re-export server only having to do the WAN lookups once (within a
>> > > specified coherency time).
>> > > 
>> > > Keeping the file data in the vfs page cache or on disk using fscache/cachefiles
>> > > is fairly straightforward, but keeping the metadata cached is particularly
>> > > difficult. And without the cached metadata we introduce long delays before we
>> > > can serve the already present and locally cached file data to many waiting
>> > > clients.
>> > > 
>> > > ----- On 7 Sep, 2020, at 18:31, Daire Byrne daire@dneg.com wrote:
>> > > > 2) If we cache metadata on the re-export server using actimeo=3600,nocto we can
>> > > > cut the network packets back to the origin server to zero for repeated lookups.
>> > > > However, if a client of the re-export server walks paths and memory maps those
>> > > > files (i.e. loading an application), the re-export server starts issuing
>> > > > unexpected calls back to the origin server again, ignoring/invalidating the
>> > > > re-export server's NFS client cache. We worked around this this by patching an
>> > > > inode/iversion validity check in inode.c so that the NFS client cache on the
>> > > > re-export server is used. I'm not sure about the correctness of this patch but
>> > > > it works for our corner case.
>> > > 
>> > > If we use actimeo=3600,nocto (say) to mount a remote software volume on the
>> > > re-export server, we can successfully cache the loading of applications and
>> > > walking of paths directly on the re-export server such that after a couple of
>> > > runs, there are practically zero packets back to the originating NFS server
>> > > (great!). But, if we then do the same thing on a client which is mounting that
>> > > re-export server, the re-export server now starts issuing lots of calls back to
>> > > the originating server and invalidating it's client cache (bad!).
>> > > 
>> > > I'm not exactly sure why, but the iversion of the inode gets changed locally
>> > > (due to atime modification?) most likely via invocation of method
>> > > inode_inc_iversion_raw. Each time it gets incremented the following call to
>> > > validate attributes detects changes causing it to be reloaded from the
>> > > originating server.
>> > > 
>> > 
>> > I'd expect the change attribute to track what's in actual inode on the
>> > "home" server. The NFS client is supposed to (mostly) keep the raw
>> > change attribute in its i_version field.
>> > 
>> > The only place we call inode_inc_iversion_raw is in
>> > nfs_inode_add_request, which I don't think you'd be hitting unless you
>> > were writing to the file while holding a write delegation.
>> > 
>> > What sort of server is hosting the actual data in your setup?
>> 
>> We mostly use RHEL7.6 NFS servers with XFS backed filesystems and a couple of
>> (older) Netapps too. The re-export server is running the latest mainline
>> kernel(s).
>> 
>> As far as I can make out, both these originating (home) server types exhibit a
>> similar (but not exactly the same) effect on the Linux NFS client cache when it
>> is being re-exported and accessed by other clients. I can replicate it when
>> only using a read-only mount at every hop so I don't think that writes are
>> related.
>> 
>> Our RHEL7 NFS servers actually mount XFS with noatime too so any atime updates
>> that might be causing this client invalidation (which is what I initially
>> thought) are ultimately a wasted effort.
>> 
> 
> Ok. I suspect there is a bug here somewhere, but with such a complicated
> setup though it's not clear to me where that bug would be though. You
> might need to do some packet sniffing and look at what the servers are
> sending for change attributes.
> 
> nfsd4_change_attribute does mix in the ctime, so your hunch about the
> atime may be correct. atime updates imply a ctime update and that could
> cause nfsd to continually send a new one, even on files that aren't
> being changed.
> 
> It might be interesting to doctor nfsd4_change_attribute() to not mix in
> the ctime and see whether that improves things. If it does, then we may
> want to teach nfsd how to avoid doing that for certain types of
> filesystems.

Okay, I started to run back through all my tests again with various combinations of server, client mount options, NFS version etc. with the intention of packet capturing as Jeff has suggested.

But I quickly realised that I had mixed up some previous results before I reported them here. The summary is that using an NFS RHEL76 server, a client mounting with a recent mainline kernel and re-exporting using NFSv4.x all the way through does NOT invalidate the re-export server's NFS client cache (great!) like I had assumed before. It does when we mount the originating RHEL7 server using NFSv3 and re-export, but not with any version of NFSv4 on Linux.

But I think I know how I got confused - the Netapp NFSv4 case is different. When we mount our (old) 7-mode Netapp using NFSv4.0 and re-export that, the re-export server's client cache is invalidated often in the same way as for an NFSv3 server. On top of that, I think I wrongly mistook some of the NFSv4 client's natural dropping of metadata from page cache as client invalidations caused by the re-export and client access (without vfs_cache_pressure=0 and see my #3 bullet point).

Both of these conspired to make me think that both NFSv3 AND NFSv4 re-exporting showed the same issue when in fact, it's just NFSv3 and the Netapp's v4.0 that require my "hack" to stop the client cache being invalidated. Sorry for any confusion (it is indeed a complicated setup!). Let me summarise then once and for all:

rhel76 server (xfs noatime) -> re-export server (vers=4.x,nocto,actimeo=3600,ro; vfs_cache_pressure=0) = good client cache metadata performance, my hacky patch is not required.
rhel76 server (xfs noatime) -> re-export server (vers=3,nocto,actimeo=3600,ro; vfs_cache_pressure=0) = bad performance (new lookups & getattrs), my hacky patch is required for better performance.
netapp (7-mode) -> re-export server (vers=4.0,nocto,actimeo=3600,ro; vfs_cache_pressure=0) = bad performance, my hacky patch is required for better performance.

So for Jeff's original intention of proxying a NFSv3 server -> NFSv4 clients by re-exporting, the metadata lookup performance will degrade severely as more clients access the same files because the re-export server's client cache is not being used as effectively (re-exported) and lookups are happening for the same files many times within the re-export server's actimeo even with vfs_cache_pressure=0.

For our particular use case, we could live without NFSv3 (and my horrible hack) except for the fact that the Netapp shows similar behaviour with NFSv4.0 (but Linux servers do not). I don't know if turning off atime updates on the Netapp volume will change anything - I might try it. Of course, re-exporting NFSv3 with good meatadata cache performance is still a nice thing to have too.

I'll now see if I can decipher the network calls back to the Netapp (NFSv4.0) as suggested by Jeff to see why it is different.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

