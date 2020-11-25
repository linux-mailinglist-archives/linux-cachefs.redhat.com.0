Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA842C4686
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 Nov 2020 18:16:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-LSPW1lOpNAOpFActujVhrA-1; Wed, 25 Nov 2020 12:16:04 -0500
X-MC-Unique: LSPW1lOpNAOpFActujVhrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5D3E190A7A1;
	Wed, 25 Nov 2020 17:16:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DFF05D71D;
	Wed, 25 Nov 2020 17:16:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C77A2180954D;
	Wed, 25 Nov 2020 17:16:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APHEx3H011831 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 12:14:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB5FF1009A1D; Wed, 25 Nov 2020 17:14:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E734F112C076
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 17:14:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70E2103B803
	for <linux-cachefs@redhat.com>; Wed, 25 Nov 2020 17:14:55 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-588-tHFpEE7yNdmpKo0Wqj_mxQ-1;
	Wed, 25 Nov 2020 12:14:53 -0500
X-MC-Unique: tHFpEE7yNdmpKo0Wqj_mxQ-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id 1F49A39616D;
	Wed, 25 Nov 2020 17:14:52 +0000 (GMT)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KOu2BXi-Eo2H; Wed, 25 Nov 2020 17:14:52 +0000 (GMT)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id F3F8A39616B;
	Wed, 25 Nov 2020 17:14:51 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id E0D688237816;
	Wed, 25 Nov 2020 17:14:51 +0000 (GMT)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id kWBnEEtUyp-l; Wed, 25 Nov 2020 17:14:51 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id C1074826D259;
	Wed, 25 Nov 2020 17:14:51 +0000 (GMT)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id J1MMs1WOxq3A; Wed, 25 Nov 2020 17:14:51 +0000 (GMT)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id A144C8237816;
	Wed, 25 Nov 2020 17:14:51 +0000 (GMT)
Date: Wed, 25 Nov 2020 17:14:51 +0000 (GMT)
From: Daire Byrne <daire@dneg.com>
To: bfields <bfields@fieldses.org>
Message-ID: <932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
In-Reply-To: <20201124211522.GC7173@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: jRr/eG2N4Ts+gxyP7atxT3VAnkSniQ==
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


----- On 24 Nov, 2020, at 21:15, bfields bfields@fieldses.org wrote:
> On Tue, Nov 24, 2020 at 08:35:06PM +0000, Daire Byrne wrote:
>> Sometimes I have seen clusters of 16 GETATTRs for the same file on the
>> wire with nothing else inbetween. So if the re-export server is the
>> only "client" writing these files to the originating server, why do we
>> need to do so many repeat GETATTR calls when using nconnect>1? And why
>> are the COMMIT calls required when the writes are coming via nfsd but
>> not from userspace on the re-export server? Is that due to some sort
>> of memory pressure or locking?
>> 
>> I picked the NFSv3 originating server case because my head starts to
>> hurt tracking the equivalent packets, stateids and compound calls with
>> NFSv4. But I think it's mostly the same for NFSv4. The writes through
>> the re-export server lead to lots of COMMITs and (double) GETATTRs but
>> using nconnect>1 at least doesn't seem to make it any worse like it
>> does for NFSv3.
>> 
>> But maybe you actually want all the extra COMMITs to help better
>> guarantee your writes when putting a re-export server in the way?
>> Perhaps all of this is by design...
> 
> Maybe that's close-to-open combined with the server's tendency to
> open/close on every IO operation?  (Though the file cache should have
> helped with that, I thought; as would using version >=4.0 on the final
> client.)
> 
> Might be interesting to know whether the nocto mount option makes a
> difference.  (So, add "nocto" to the mount options for the NFS mount
> that you're re-exporting on the re-export server.)

The nocto didn't really seem to help but the NFSv4.2 re-export of a NFSv3 server did. I also realised I had done some tests with nconnect on the re-export server's client and consequently mixed things up a bit in my head. So I did some more tests and tried to make the results clear and simple. In all cases I'm just writing a big file with "dd" and capturing the traffic between the originating server and re-export server.

First off, writing direct to the originating server mount on the re-export server from userspace shows the ideal behaviour for all combinations:

 originating server <- (vers=X,actimeo=1800,nconnect=X) <- reexport server writing = WRITE,WRITE .... repeating (good!)

Then re-exporting a NFSv4.2 server:

 originating server <- (vers=4.2) <- reexport server - (vers=3) <- client writing = GETATTR,COMMIT,WRITE .... repeating
 originating server <- (vers=4.2) <- reexport server - (vers=4.2) <- client writing = GETATTR,WRITE .... repeating

And re-exporting a NFSv3 server:

 originating server <- (vers=3) <- reexport server - (vers=4.2) <- client writing = WRITE,WRITE .... repeating (good!)
 originating server <- (vers=3) <- reexport server - (vers=3) <- client writing = WRITE,COMMIT .... repeating
  
So of all the combinations, a NFSv4.2 re-export of an NFSv3 server is the only one that matches the "ideal" case where we WRITE continuously without all the extra chatter.

And for completeness, taking that "good" case and making it bad with nconnect:

 originating server <- (vers=3,nconnect=16) <- reexport server - (vers=4.2) <- client writing = WRITE,WRITE .... repeating (good!)
 originating server <- (vers=3) <- reexport server <- (vers=4.2,nconnect=16) <- client writing = WRITE,COMMIT,GETATTR .... randomly repeating

So using nconnect on the re-export's client causes lots more metadata ops. There are reasons for doing that for increasing throughput but it could be that the gain is offset by the extra metadata roundtrips. 

Similarly, we have mostly been using a NFSv4.2 re-export of a NFSV4.2 server over the WAN because of reduced metadata ops for reading, but it looks like we incur extra metadata ops for writing.

Side note: it's hard to decode nconnect enabled packet captures because wireshark doesn't seem to like those extra port streams.

> By the way I made a start at a list of issues at
> 
>	http://wiki.linux-nfs.org/wiki/index.php/NFS_re-export
> 
> but I was a little vague on which of your issues remained and didn't
> take much time over it.

Cool. I'm glad there are some notes for others to reference - this thread is now too long for any human to read. The only things I'd consider adding are:

* re-export of NFSv4.0 filesystem can give input/output errors when the cache is dropped
* a weird interaction with nfs client readahead such that all reads are limited to the default 128k unless you manually increase it to match rsize.

The only other thing I can offer are tips & tricks for doing this kind of thing over the WAN (vfs_cache_pressure, actimeo, nocto) and using fscache.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

