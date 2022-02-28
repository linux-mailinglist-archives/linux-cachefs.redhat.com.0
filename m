Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D84C6F16
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Feb 2022 15:15:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-_a3tPz96Peifv53zW-AJcQ-1; Mon, 28 Feb 2022 09:15:02 -0500
X-MC-Unique: _a3tPz96Peifv53zW-AJcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2285F58D7;
	Mon, 28 Feb 2022 14:14:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 306E07C0E0;
	Mon, 28 Feb 2022 14:14:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9509B4A701;
	Mon, 28 Feb 2022 14:14:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21SEEnf4012168 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 28 Feb 2022 09:14:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7071BC5094B; Mon, 28 Feb 2022 14:14:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BE48C5094A
	for <linux-cachefs@redhat.com>; Mon, 28 Feb 2022 14:14:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EF42802A5A
	for <linux-cachefs@redhat.com>; Mon, 28 Feb 2022 14:14:49 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-571-jzUkJuWOOnmCjKgjufu3lQ-1; Mon, 28 Feb 2022 09:14:47 -0500
X-MC-Unique: jzUkJuWOOnmCjKgjufu3lQ-1
Received: by mail-vs1-f53.google.com with SMTP id d11so13093264vsm.5;
	Mon, 28 Feb 2022 06:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=M1Xyh9NeSOMFmMurlKuwWO89EOwaqEp9Ci8MZPOB7hg=;
	b=ip4Xp2T+GqmxCk2+XTzbzZtDp0QnyGKwPdLIql5RN1STLvuXifrp2twrzDmQqZG9NG
	1eKQBzZV5n+S3rc4cYTAzg7lFob1CyoSjfhBbgbJKH2LfdS8YPgxYfruGdsZEBfICTMy
	L0a4WXR7BkjwCTA09yM28q/tNRHplD8mrr46eVj0XwxDHaZuf2Ff0PpPAfsD2HYMCOyJ
	eF0SwvZXaL0PV3wFQOz/6g7UF1IcdJ0Gnj3JnpAronhYqWQhvVorVd1/zt0yOPFj6YaB
	cL6xAp5TXoDbyfqcrQDccY8C0pTgB0DmqxJveR8TnKx14r3GDHjkla5RmomW1XQzh63I
	GO4w==
X-Gm-Message-State: AOAM532tDRw9RvkTxwXVTp4ow9htH0Nla2YFlRlmSSn9uNE5PAvh4gFg
	Vzq6TOaB+HyK1sF3Ym6dPErCGA7IMamIjqQ0OAw4irBcEk4=
X-Google-Smtp-Source: ABdhPJyzyJR+BDDAskg9D/cVOfI18uOQsM5+pRk3fyetFPg9yXUsjjt1l97iFK0dT6JkS678hbJrWQ73y6pWFZ/+8c4=
X-Received: by 2002:a05:6102:418a:b0:31a:1d33:6803 with SMTP id
	cd10-20020a056102418a00b0031a1d336803mr7784558vsb.40.1646057686549;
	Mon, 28 Feb 2022 06:14:46 -0800 (PST)
MIME-Version: 1.0
References: <164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311919732.2806745.2743328800847071763.stgit@warthog.procyon.org.uk>
	<CACdtm0YtxAUMet_PSxpg69OR9_TQbMQOzU5Kbm_5YDe_C7Nb-w@mail.gmail.com>
	<3013921.1644856403@warthog.procyon.org.uk>
In-Reply-To: <3013921.1644856403@warthog.procyon.org.uk>
From: Rohith Surabattula <rohiths.msft@gmail.com>
Date: Mon, 28 Feb 2022 19:44:35 +0530
Message-ID: <CACdtm0Z4zXpbPBLJx-=AgBRd63hp_n+U-5qc0gQDQW0c2PY7gg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 21SEEnf4012168
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
	smfrench@gmail.com, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 7/7] cifs: Use netfslib to handle
	reads
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

Below is the trace o/p when mounted with fsc option:
              vi-1631    [000] .....  2519.247539: netfs_read:
R=00000006 READAHEAD c=00000000 ni=0 s=0 1000
              vi-1631    [000] .....  2519.247540: netfs_read:
R=00000006 EXPANDED  c=00000000 ni=0 s=0 1000
              vi-1631    [000] .....  2519.247550: netfs_sreq:
R=00000006[0] PREP  DOWN f=00 s=0 0/100000 e=0
              vi-1631    [000] .....  2519.247551: netfs_sreq:
R=00000006[0] SUBMT DOWN f=00 s=0 0/100000 e=0
           cifsd-1390    [001] .....  2519.287542: netfs_sreq:
R=00000006[0] TERM  DOWN f=02 s=0 100000/100000 e=0
           cifsd-1390    [001] .....  2519.287545: netfs_rreq:
R=00000006 ASSESS f=20
           cifsd-1390    [001] .....  2519.287545: netfs_rreq:
R=00000006 UNLOCK f=20
           cifsd-1390    [001] .....  2519.287571: netfs_rreq:
R=00000006 DONE   f=00
           cifsd-1390    [001] .....  2519.287572: netfs_sreq:
R=00000006[0] FREE  DOWN f=02 s=0 100000/100000 e=0
           cifsd-1390    [001] .....  2519.287573: netfs_rreq:
R=00000006 FREE   f=00

Mount :
root@netfsvm:/sys/kernel/debug/tracing# sudo mount -t cifs
//netfsstg.file.core.windows.net/testshare on /mnt/testshare type cifs
(rw,relatime,vers=3.0,cache=strict,username=netfsstg,uid=0,noforceuid,gid=0,noforcegid,addr=52.239.170.72,file_mode=0777,dir_mode=0777,soft,persistenthandles,nounix,serverino,mapposix,fsc,rsize=1048576,wsize=1048576,bsize=1048576,echo_interval=60,actimeo=1)

I dont see writing fscache. It always downloads from the server.

root@netfsvm:/sys/kernel/debug/tracing# ps -A | grep cache
    450 ?        00:00:00 mkey_cache
   1361 ?        00:00:00 cachefilesd

root@netfsvm:/sys/kernel/debug/tracing# cat /proc/fs/fscache/stats
FS-Cache statistics
Cookies: n=29 v=1 vcol=0 voom=0
Acquire: n=29 ok=29 oom=0
LRU    : n=0 exp=0 rmv=0 drp=0 at=0
Invals : n=0
Updates: n=0 rsz=0 rsn=0
Relinqs: n=0 rtr=0 drop=0
NoSpace: nwr=0 ncr=0 cull=0
IO     : rd=0 wr=0
RdHelp : DR=0 RA=6 RP=0 WB=0 WBZ=7 rr=0 sr=0
RdHelp : ZR=0 sh=0 sk=7
RdHelp : DL=6 ds=6 df=0 di=0
RdHelp : RD=0 rs=0 rf=0
RdHelp : WR=0 ws=0 wf=0

root@netfsvm:/sys/kernel/debug/tracing# cat /proc/fs/fscache/cookies
COOKIE   VOLUME   REF ACT ACC S FL DEF
======== ======== === === === = == ================
00000002 00000001   1   0   0 - 4008 302559bec76a7924,
0a13e961000000000a13e96100000000d01f4719d01f4719
00000003 00000001   1   0   0 - 4000 0000000000640090,
37630162000000003763016200000000e8650f119c49f411
00000004 00000001   1   0   0 - 4000 00000000001800f0,
244e016200000000244e01620000000044975123c042f525
00000005 00000001   1   0   0 - 4000 00000000007000a0,
ea92e96100000000ea92e96100000000acee2035acee2035
00000006 00000001   1   0   0 - 4000 00000000007000c0,
ad92e96100000000ad92e96100000000407da317407da317
00000007 00000001   1   0   0 - 4000 00000000002800e0,
4aeaf361000000004aeaf3610000000078c77b0d6850dc1f
00000008 00000001   1   0   0 - 4008 0000000000140080,
df92136200000000df92136200000000b8e0f30eb8e0f30e
00000009 00000001   1   0   0 - 4008 00000000001400e0,
d39d136200000000d39d136200000000f4e6e51bf4e6e51b
0000000a 00000001   1   0   0 - 4008 0000000000140090,
d99d136200000000d99d136200000000dcd77d28dcd77d28
0000000b 00000001   1   0   0 - 4008 0000000000540080,
cdd21c6200000000cdd21c62000000009c8cd90c9c8cd90c
0000000c 00000001   1   0   0 - 4008 00000000005400c0,
cdd21c6200000000cdd21c6200000000f44b440df44b440d
0000000d 00000001   1   0   0 - 4008 00000000005400a0,
cdd21c6200000000cdd21c62000000005487b50f5487b50f
0000000e 00000001   1   0   0 - 4008 00000000005400e0,
ebd21c6200000000ebd21c6200000000c07c1800c07c1800
0000000f 00000001   1   0   0 - 4008 0000000000540090,
ebd21c6200000000ebd21c620000000094fc730094fc7300
00000010 00000001   1   0   0 - 4008 00000000005400d0,
ebd21c6200000000ebd21c6200000000bcb78902bcb78902
00000011 00000001   1   0   0 - 4008 00000000005400b0,
29d31c620000000029d31c62000000002c02e8252c02e825
00000012 00000001   1   0   0 - 4008 00000000005400f0,
29d31c620000000029d31c6200000000c83fae26c83fae26
00000013 00000001   1   0   0 - 4008 0000000000540088,
29d31c620000000029d31c6200000000e4fcc328e4fcc328
00000014 00000001   1   0   0 - 4008 00000000005400c8,
3bd31c62000000003bd31c6200000000747b780b747b780b
00000015 00000001   1   0   0 - 4008 00000000005400a8,
3bd31c62000000003bd31c6200000000ecf57e0decf57e0d
00000016 00000001   1   0   0 - 4008 00000000005400e8,
b0d51c6200000000b0d51c62000000002005e5092005e509
00000017 00000001   1   0   0 - 4008 0000000000540098,
b0d51c6200000000b0d51c620000000034035f0a34035f0a
00000018 00000001   1   0   0 - 4008 00000000005400d8,
b0d51c6200000000b0d51c62000000001cfdc00c1cfdc00c
00000019 00000001   1   0   0 - 4008 00000000005400b8,
50d61c620000000050d61c62000000004453d0384453d038
0000001a 00000001   1   0   0 - 4008 00000000005400f8,
50d61c620000000050d61c6200000000d4113b39d4113b39
0000001b 00000001   1   0   0 - 4008 0000000000540084,
51d61c620000000051d61c62000000002042020020420200
0000001c 00000001   1   0   0 - 4008 00000000005400c4,
16d71c620000000016d71c62000000009ceb0d019ceb0d01
0000001d 00000001   1   0   0 - 4008 00000000005400a4,
16d71c620000000016d71c6200000000dcae7801dcae7801
0000001e 00000001   1   0   0 - 4008 00000000005400e4,
16d71c620000000016d71c6200000000ec2af903ec2af903

I have enabled below fscache and cachefiles related tracepoints. But
nothing is getting printed in trace o/p.
echo 1 >/sys/kernel/debug/tracing/events/fscache/fscache_access/enable
echo 1 >/sys/kernel/debug/tracing/events/fscache/fscache_active/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_coherency/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_read/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_write/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_io_error/enable
echo 1 >/sys/kernel/debug/tracing/events/cachefiles/cachefiles_vfs_error/enable
echo 1 > events/cachefiles/cachefiles_vol_coherency/enable

Regards,
Rohith

On Mon, Feb 14, 2022 at 10:03 PM David Howells <dhowells@redhat.com> wrote:
>
> Rohith Surabattula <rohiths.msft@gmail.com> wrote:
>
> > I have tested netfs integration with fsc mount option enabled. But, I
> > observed function "netfs_cache_prepare_read" always returns
> > "NETFS_DOWNLOAD_FROM_SERVER" because cres->ops(i.e cachefiles
> > operations) is not set.
>
> I see it download from the server and write to the cache:
>
>         # cat /proc/fs/fscache/stats
>         ...
>         IO     : rd=0 wr=4     <---- no reads, four writes made
>         RdHelp : DR=0 RA=4 RP=0 WB=0 WBZ=0 rr=0 sr=0
>         RdHelp : ZR=0 sh=0 sk=0
>         RdHelp : DL=4 ds=4 df=0 di=0
>         RdHelp : RD=0 rs=0 rf=0
>         RdHelp : WR=4 ws=4 wf=0
>
> Turning on the cachefiles_vol_coherency tracepoint, I see:
>
>      kworker/2:2-1040    [002] .....   585.499799: cachefiles_vol_coherency: V=00000003 VOL BAD cmp  B=480004
>      kworker/2:2-1040    [002] .....   585.499872: cachefiles_vol_coherency: V=00000003 VOL SET ok   B=480005
>
> every time I unmount and mount again.  One of the fields is different each
> time.
>
> Using the netfs tracepoints, I can see the download being made from the server
> and then the subsequent write to the cache:
>
>           md5sum-4689    [003] .....   887.382290: netfs_read: R=00000005 READAHEAD c=0000004e ni=86 s=0 20000
>           md5sum-4689    [003] .....   887.383076: netfs_read: R=00000005 EXPANDED  c=0000004e ni=86 s=0 400000
>           md5sum-4689    [003] .....   887.383252: netfs_sreq: R=00000005[0] PREP  DOWN f=01 s=0 0/400000 e=0
>           md5sum-4689    [003] .....   887.383252: netfs_sreq: R=00000005[0] SUBMT DOWN f=01 s=0 0/400000 e=0
>            cifsd-4687    [002] .....   887.394926: netfs_sreq: R=00000005[0] TERM  DOWN f=03 s=0 400000/400000 e=0
>            cifsd-4687    [002] .....   887.394928: netfs_rreq: R=00000005 ASSESS f=22
>            cifsd-4687    [002] .....   887.394928: netfs_rreq: R=00000005 UNLOCK f=22
>     kworker/u8:4-776     [000] .....   887.395000: netfs_rreq: R=00000005 WRITE  f=02
>     kworker/u8:4-776     [000] .....   887.395005: netfs_sreq: R=00000005[0] WRITE DOWN f=03 s=0 400000/400000 e=0
>      kworker/3:2-1001    [003] .....   887.627881: netfs_sreq: R=00000005[0] WTERM DOWN f=03 s=0 400000/400000 e=0
>      kworker/3:2-1001    [003] .....   887.628163: netfs_rreq: R=00000005 DONE   f=02
>      kworker/3:2-1001    [003] .....   887.628165: netfs_sreq: R=00000005[0] FREE  DOWN f=03 s=0 400000/400000 e=0
>     kworker/u8:4-776     [000] .....   887.628216: netfs_rreq: R=00000005 FREE   f=02
>
> Can you mount a cifs share with "-o fsc", read a file and then look in
> /proc/fs/fscache/cookies and /proc/fs/fscache/stats for me?
>
> David
>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

