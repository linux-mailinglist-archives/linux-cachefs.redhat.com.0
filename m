Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C328F627E40
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Nov 2022 13:43:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668429797;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0ICBxsMx6TWYbFfQDODA3/MJhstbAGkTzZGudo0juxg=;
	b=frRsKXZOPO6MmK1+H8JjX5sOv+q8hMY3LoC9w/6QSXV2fTTisURRebqI4LPu5QZ/7rSulP
	iO2EvkuMY+737mQ8AVl31NLTezqa/uduAdeFZwyq1PN/giSRuO71IEOKEvr+pC8MA+F1dj
	57SWANxlZuuO67irr759RNyTheKgLkI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-9TxyisGEPGu1mp60D9eYXw-1; Mon, 14 Nov 2022 07:43:13 -0500
X-MC-Unique: 9TxyisGEPGu1mp60D9eYXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F5C984ACA8;
	Mon, 14 Nov 2022 12:43:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 468D31400E43;
	Mon, 14 Nov 2022 12:43:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 32723194658F;
	Mon, 14 Nov 2022 12:43:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2E7401946589 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 14 Nov 2022 12:43:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0AAC84EA4E; Mon, 14 Nov 2022 12:43:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01E1739D6A
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 12:43:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9012811E67
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 12:43:07 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558--wq54XG3OL-jxEyIzGCp6w-1; Mon, 14 Nov 2022 07:43:04 -0500
X-MC-Unique: -wq54XG3OL-jxEyIzGCp6w-1
Received: by mail-il1-f176.google.com with SMTP id d3so5658785ils.1
 for <linux-cachefs@redhat.com>; Mon, 14 Nov 2022 04:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lr8jKcb5TtjvgIABPFXYn0b7xrI0Tbsth2ZN6lP7quE=;
 b=GBfCJj3M1oP1kQAzygDfKfA2KzI0d70OkGq5HYJOo0IwHNHgnk+U3Nqf2s4YQCqACf
 IynVeOoundvzhgaU1NVMa9wJvFbkNfqKVtpP/LHK8/+AIW9NkvHnaqSuZ6RXDflqNIj+
 Lxq83bmWzMtiR4fhHG5soS/WhAHmQBYu9CcQYDtK3dppv4o0yDtXkJJUsXfLLmIY8kHm
 SLPkgNPqyGwyun5rUqy4222wR1QkcKAuTnvlli43UZtblmtgwK3ySCc7SFW2zEKQUWY6
 F29Js5nvB0pYOg8bFHQzsJ9OLG8HPsd26fXvggqYaSleMHNeZk6YVFzde3h2FXU5cx/V
 nE8g==
X-Gm-Message-State: ANoB5pl4DH+TmhSgE47odoTBWGl9zZm/ZMWB/HGLEnD3yy1tI6aL4Mdg
 wqbCR5hF4elUjDTH+lNTagFciCo+k83NSd2S7FyrXA==
X-Google-Smtp-Source: AA0mqf7KwzLt957PE0YjJvtXTv4NRVv2HYdl5XAK+gusZ1n9O1uwnQYL01LhZkk7vfwiGPcvmByftAN6YVL7JEIBzro=
X-Received: by 2002:a05:6e02:e12:b0:300:bedf:9291 with SMTP id
 a18-20020a056e020e1200b00300bedf9291mr5950687ilk.242.1668429782656; Mon, 14
 Nov 2022 04:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20221017105212.77588-1-dwysocha@redhat.com>
 <20221017105212.77588-4-dwysocha@redhat.com>
 <870684b35a45b94c426554a62b63f80f421dbb08.camel@kernel.org>
 <CALF+zOm+-2QLOMu4J7NAK++xfjZ8SQqmMh8zNFcM2H78_qYAzA@mail.gmail.com>
 <0676ecb2bb708e6fc29dbbe6b44551d6a0d021dc.camel@kernel.org>
 <CALF+zOnRH_GiZooiNm1=J+gOpLMEncO72SA4jAmL+agG9RjbYg@mail.gmail.com>
 <CALF+zOmDzp-UhLC0Dk4fmsjEzWgM75m5uOMBjv6TjTFYtbWPAQ@mail.gmail.com>
 <1B2E1442-EB0A-43E3-96BB-15C717E966E5@hammerspace.com>
 <CA+QRt4vM3NncgCWjKncorHmiWpCrJ7FsLC=y+v7gnEwYpM3PSw@mail.gmail.com>
 <CALF+zOkxbLV4qzkaydBThmKfQKOP07jyq8o10YMfP2TgvAdZMQ@mail.gmail.com>
In-Reply-To: <CALF+zOkxbLV4qzkaydBThmKfQKOP07jyq8o10YMfP2TgvAdZMQ@mail.gmail.com>
From: Benjamin Maynard <benmaynard@google.com>
Date: Mon, 14 Nov 2022 12:42:26 +0000
Message-ID: <CA+QRt4v2qP5gAxiwYbyHEQHOCG4=fVDBwSBsXJrXb=GaFCKtYg@mail.gmail.com>
To: David Wysochanski <dwysocha@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v9 3/5] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
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
 Brennan Doyle <brennandoyle@google.com>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trondmy@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks Dave for getting back to me so quickly.

> Due to use of "drop_caches" this is almost certainly the known issue #1
> I mentioned in the opening post of this series:
> https://lore.kernel.org/all/20221103161637.1725471-1-dwysocha@redhat.com/

Apologies, I completely missed the known issues in the original
opening message of the series. Just to clarify, I was only ever
dropping the caches on the "NFS Client" in the below relationship:

Source NFS Server <-- Re-Export Server (with FS-Cache) <-- NFS Client.

I never dropped the caches on the Re-Export Server (the server running
FS-Cache) at any point.

However my rsize was lower than my readahead value. I've since corrected that:

benmaynard@demo-cluster-1-26hm:~$ cat /proc/mounts | grep nfs
10.0.0.49:/files /srv/nfs/files nfs
rw,noatime,vers=3,rsize=1048576,wsize=1048576,namlen=255,acregmin=600,acregmax=600,acdirmin=600,acdirmax=600,hard,nocto,proto=tcp,nconnect=16,timeo=600,retrans=2,sec=sys,mountaddr=10.0.0.49,mountvers=3,mountport=37485,mountproto=tcp,fsc,local_lock=none,addr=10.0.0.49
0 0

benmaynard@demo-cluster-1-26hm:~$ findmnt -rnu -t nfs,nfs4 -o MAJ:MIN,TARGET
0:52 /srv/nfs/files
benmaynard@demo-cluster-1-26hm:~$ cat /sys/class/bdi/0\:52/read_ahead_kb
512

With this configuration I see the same issue, FS-Cache never reads
from /var/cache/fscache, and copying the same file always leads to
heavy writes to /var/cache/fscache (the cache is overwriting itself).

I have also tried this copy without clearing the caches on any server
in the chain, and the same happens.

Would you expect this behaviour even though rsize > read ahead? Would
you expect the referenced patch to fix this?

I tried to apply the patch you suggested
(https://www.mail-archive.com/linux-cachefs@redhat.com/msg03043.html)
but it did not apply cleanly, and I ran out of time to troubleshoot. I
should get some more time on Wednesday and I can re-try.


Kind Regards
Benjamin Maynard


Kind Regards

Benjamin Maynard

Customer Engineer

benmaynard@google.com

Google, Inc.




On Mon, 14 Nov 2022 at 10:41, David Wysochanski <dwysocha@redhat.com> wrote:
>
> Hi Ben,
>
> Thanks for testing these patches.  More below.
>
> On Sat, Nov 12, 2022 at 7:47 AM Benjamin Maynard <benmaynard@google.com> wrote:
> >
> > Hi all,
> >
> > I've been doing some more testing with these patches, I applied all of
> > the patches (v10 from
> > https://patchwork.kernel.org/project/linux-nfs/list/?series=691729)
> > apart from Patch 6 (the RFC patch) to version 6.0.8 of the kernel.
> >
> > I have the following setup:
> >
> > Source NFS Server <-- Re-Export Server (with FS-Cache) <-- NFS Client.
> >
> > I have a 500Gb file on the Source NFS Server, which I am then copying
> > to the NFS Client via the Re-Export Server.
> >
> > On the first copy, I see heavy writes to /var/cache/fscache on the
> > re-export server, and once the file copy completes I see that
> > /var/cache/fscache is approximately 500Gb in size. All good so far.
> >
> > I then deleted that file from the NFS Client, and dropped the caches
> > just to be safe (echo 3 > /proc/sys/vm/drop_caches on the NFS Client).
> >
> > I then performed another copy of the 500Gb file on the NFS Client,
> > again via the Re-Export Server. What I expected would happen is that I
> > would see heavy reads from the /var/cache/fscache volume as the file
> > should be served from FS-Cache.
> >
> > However what I actually saw was no reads whatsoever, FS-Cache seems to
> > be ignored and the file is pulled from the Source NFS Filer again. I
> > also see heavy writes to /var/cache/fscache, so it appears that
> > FS-Cache is overwriting its existing cache, and never using it.
> >
> Due to use of "drop_caches" this is almost certainly the known issue #1
> I mentioned in the opening post of this series:
> https://lore.kernel.org/all/20221103161637.1725471-1-dwysocha@redhat.com/
>
> The above issue will be fixed with the following patch which has not
> been merged yet:
> https://www.mail-archive.com/linux-cachefs@redhat.com/msg03043.html
>
> Do you have time to do another test to verify that is the case?
> If so, I can re-post that patch on top of the first 5 patches in this series,
> as well as a second patch that allows NFS to use it.
>
>
> > I only have 104Gb of memory on the Re-Export Server (with FS-Cache) so
> > it is not possible that the file is being served from the page cache.
> >
> > We saw this behaviour before on an older set of the patches when our
> > mount between the Re-Export Server and the Source NFS Filer was using
> > the "sync" option, but we are now using the "async" option and the
> > same is happening.
> >
> > Mount options:
> >
> > Source NFS Server <-- Re-Export Server (with FS-Cache):
> >
> > 10.0.0.49:/files /srv/nfs/files nfs
> > rw,noatime,vers=3,rsize=1048576,wsize=1048576,namlen=255,acregmin=600,acregmax=600,acdirmin=600,acdirmax=600,hard,nocto,proto=tcp,nconnect=16,timeo=600,retrans=2,sec=sys,mountaddr=10.0.0.49,mountvers=3,mountport=37485,mountproto=tcp,fsc,local_lock=none,addr=10.0.0.49
> >
> > Re-Export Server (with FS-Cache) <-- NFS Client:
> >
> > 10.0.0.3:/files /mnt/nfs nfs
> > rw,relatime,vers=3,rsize=1048576,wsize=1048576,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=10.0.0.3,mountvers=3,mountport=20048,mountproto=tcp,local_lock=none,addr=10.0.0.3
> >
> > It is also worth noting this behaviour is not unique to the re-export
> > use case. I see FS-Cache not being used with the following setup:
> >
> > Source NFS Server <-- Client (with FS-Cache).
> >
> > Thanks,
> > Ben
> >
> >
> > Kind Regards
> >
> > Benjamin Maynard
> >
> > Customer Engineer
> >
> > benmaynard@google.com
> >
> > Google, Inc.
> >
> >
> >
> >
> > On Mon, 31 Oct 2022 at 22:22, Trond Myklebust <trondmy@hammerspace.com> wrote:
> > >
> > >
> > >
> > > > On Oct 30, 2022, at 19:25, David Wysochanski <dwysocha@redhat.com> wrote:
> > > >
> > > > On Sat, Oct 29, 2022 at 12:46 PM David Wysochanski <dwysocha@redhat.com> wrote:
> > > >>
> > > >> On Fri, Oct 28, 2022 at 12:59 PM Trond Myklebust <trondmy@kernel.org> wrote:
> > > >>>
> > > >>> On Fri, 2022-10-28 at 07:50 -0400, David Wysochanski wrote:
> > > >>>> On Thu, Oct 27, 2022 at 3:16 PM Trond Myklebust <trondmy@kernel.org>
> > > >>>> wrote:
> > > >>>>>
> > > >>>>> On Mon, 2022-10-17 at 06:52 -0400, Dave Wysochanski wrote:
> > > >>>>>> Convert the NFS buffered read code paths to corresponding netfs
> > > >>>>>> APIs,
> > > >>>>>> but only when fscache is configured and enabled.
> > > >>>>>>
> > > >>>>>> The netfs API defines struct netfs_request_ops which must be
> > > >>>>>> filled
> > > >>>>>> in by the network filesystem.  For NFS, we only need to define 5
> > > >>>>>> of
> > > >>>>>> the functions, the main one being the issue_read() function.
> > > >>>>>> The issue_read() function is called by the netfs layer when a
> > > >>>>>> read
> > > >>>>>> cannot be fulfilled locally, and must be sent to the server
> > > >>>>>> (either
> > > >>>>>> the cache is not active, or it is active but the data is not
> > > >>>>>> available).
> > > >>>>>> Once the read from the server is complete, netfs requires a call
> > > >>>>>> to
> > > >>>>>> netfs_subreq_terminated() which conveys either how many bytes
> > > >>>>>> were
> > > >>>>>> read
> > > >>>>>> successfully, or an error.  Note that issue_read() is called with
> > > >>>>>> a
> > > >>>>>> structure, netfs_io_subrequest, which defines the IO requested,
> > > >>>>>> and
> > > >>>>>> contains a start and a length (both in bytes), and assumes the
> > > >>>>>> underlying
> > > >>>>>> netfs will return a either an error on the whole region, or the
> > > >>>>>> number
> > > >>>>>> of bytes successfully read.
> > > >>>>>>
> > > >>>>>> The NFS IO path is page based and the main APIs are the pgio APIs
> > > >>>>>> defined
> > > >>>>>> in pagelist.c.  For the pgio APIs, there is no way for the caller
> > > >>>>>> to
> > > >>>>>> know how many RPCs will be sent and how the pages will be broken
> > > >>>>>> up
> > > >>>>>> into underlying RPCs, each of which will have their own
> > > >>>>>> completion
> > > >>>>>> and
> > > >>>>>> return code.  In contrast, netfs is subrequest based, a single
> > > >>>>>> subrequest may contain multiple pages, and a single subrequest is
> > > >>>>>> initiated with issue_read() and terminated with
> > > >>>>>> netfs_subreq_terminated().
> > > >>>>>> Thus, to utilze the netfs APIs, NFS needs some way to accommodate
> > > >>>>>> the netfs API requirement on the single response to the whole
> > > >>>>>> subrequest, while also minimizing disruptive changes to the NFS
> > > >>>>>> pgio layer.
> > > >>>>>>
> > > >>>>>> The approach taken with this patch is to allocate a small
> > > >>>>>> structure
> > > >>>>>> for each nfs_netfs_issue_read() call, store the final error and
> > > >>>>>> number
> > > >>>>>> of bytes successfully transferred in the structure, and update
> > > >>>>>> these
> > > >>>>>> values
> > > >>>>>> as each RPC completes.  The refcount on the structure is used as
> > > >>>>>> a
> > > >>>>>> marker
> > > >>>>>> for the last RPC completion, is incremented in
> > > >>>>>> nfs_netfs_read_initiate(),
> > > >>>>>> and decremented inside nfs_netfs_read_completion(), when a
> > > >>>>>> nfs_pgio_header
> > > >>>>>> contains a valid pointer to the data.  On the final put (which
> > > >>>>>> signals
> > > >>>>>> the final outstanding RPC is complete) in
> > > >>>>>> nfs_netfs_read_completion(),
> > > >>>>>> call netfs_subreq_terminated() with either the final error value
> > > >>>>>> (if
> > > >>>>>> one or more READs complete with an error) or the number of bytes
> > > >>>>>> successfully transferred (if all RPCs complete successfully).
> > > >>>>>> Note
> > > >>>>>> that when all RPCs complete successfully, the number of bytes
> > > >>>>>> transferred
> > > >>>>>> is capped to the length of the subrequest.  Capping the
> > > >>>>>> transferred
> > > >>>>>> length
> > > >>>>>> to the subrequest length prevents "Subreq overread" warnings from
> > > >>>>>> netfs.
> > > >>>>>> This is due to the "aligned_len" in nfs_pageio_add_page(), and
> > > >>>>>> the
> > > >>>>>> corner case where NFS requests a full page at the end of the
> > > >>>>>> file,
> > > >>>>>> even when i_size reflects only a partial page (NFS overread).
> > > >>>>>>
> > > >>>>>> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > > >>>>>> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > > >>>>>
> > > >>>>>
> > > >>>>> This is not doing what I asked for, which was to separate out the
> > > >>>>> fscache functionality, so that we can call that if and when it is
> > > >>>>> available.
> > > >>>>>
> > > >>>> I must have misunderstood then.
> > > >>>>
> > > >>>> The last feedback I have from you was that you wanted it to be
> > > >>>> an opt-in feature, and it was a comment on a previous patch
> > > >>>> to Kconfig.  I was proceeding the best I knew how, but
> > > >>>> let me try to get back on track.
> > > >>>>
> > > >>>>> Instead, it is just wrapping the NFS requests inside netfs
> > > >>>>> requests. As
> > > >>>>> it stands, that means it is just duplicating information, and
> > > >>>>> adding
> > > >>>>> unnecessary overhead to the standard I/O path (extra allocations,
> > > >>>>> extra
> > > >>>>> indirect calls, and extra bloat to the inode).
> > > >>>>>
> > > >>>> I think I understand what you're saying but I'm not sure.  Let me
> > > >>>> ask some clarifying questions.
> > > >>>>
> > > >>>> Are you objecting to the code when CONFIG_NFS_FSCACHE is
> > > >>>> configured?  Or when it is not?  Or both?  I think you're objecting
> > > >>>> when it's configured, but not enabled (we mount without 'fsc').
> > > >>>> Am I right?
> > > >>>>
> > > >>>> Also, are you objecting to the design that to use fcache we now
> > > >>>> have to use netfs, specifically:
> > > >>>> - call into netfs via either netfs_read_folio or netfs_readahead
> > > >>>> - if fscache is enabled, then the IO can be satisfied from fscache
> > > >>>> - if fscache is not enabled, or some of the IO cannot be satisfied
> > > >>>> from the cache, then NFS is called back via netfs_issue_read
> > > >>>> and we use the normal NFS read pageio interface.  This requires
> > > >>>> we call netfs_subreq_terminated() when all the RPCs complete,
> > > >>>> which is the reason for the small changes to pagelist.c
> > > >>>
> > > >>> I'm objecting to any middle layer "solution" that adds overhead to the
> > > >>> NFS I/O paths.
> > > >>>
> > > >> Got it.
> > > >>
> > > >>> I'm willing to consider solutions that are specific only to the fscache
> > > >>> use case (i.e. when the 'fsc' mount option is specified). However when
> > > >>> I perform a normal NFS mount, and do I/O, then I don't want to see
> > > >>> extra memory allocations, extra indirect calls and larger inode
> > > >>> footprints.
> > > >>>
> > > >>> IOW: I want the code to optimise for the case of standard NFS, not for
> > > >>> the case of 'NFS with cachefs additions'.
> > > >>>
> > > >> I agree completely.  Are you seeing extra memory allocations
> > > >> happen on mounts without 'fsc' or is it more a concern or how
> > > >> some of the patches look?  We should not be calling any netfs or
> > > >> fscache code if 'fsc' is not on the mount and I don't see any in my
> > > >> testing. So either there's a misunderstanding here, or there's a
> > > >> bug I'm missing.
> > > >>
> > > >> If fscache is not configured, then nfs_netfs_read_folio() and
> > > >> nfs_netfs_readahead() is a wrapper that returns -ENOBUFS.
> > > >> If it's configured but not enabled, then the checks for
> > > >> netfs_inode(inode)->cache should skip over any netfs code.
> > > >> But maybe there's a non-obvious bug you're seeing and
> > > >> somehow netfs is still getting called?  Because I cannot
> > > >> see netfs getting called if 'fsc' is not on the mount in my
> > > >> tests.
> > > >>
> > > >> int nfs_netfs_read_folio(struct file *file, struct folio *folio)
> > > >> {
> > > >>       if (!netfs_inode(folio_inode(folio))->cache)
> > > >>               return -ENOBUFS;
> > > >>
> > > >>       return netfs_read_folio(file, folio);
> > > >> }
> > > >>
> > > >> int nfs_netfs_readahead(struct readahead_control *ractl)
> > > >> {
> > > >>       struct inode *inode = ractl->mapping->host;
> > > >>
> > > >>       if (!netfs_inode(inode)->cache)
> > > >>               return -ENOBUFS;
> > > >>
> > > >>       netfs_readahead(ractl);
> > > >>       return 0;
> > > >> }
> > > >>
> > > >>
> > > >>>>
> > > >>>> Can you be more specific as to the portions of the patch you don't
> > > >>>> like
> > > >>>> so I can move it in the right direction?
> > > >>>>
> > > >>>> This is from patch #2 which you didn't comment on.  I'm not sure
> > > >>>> you're
> > > >>>> ok with it though, since you mention "extra bloat to the inode".
> > > >>>> Do you object to this even though it's wrapped in an
> > > >>>> #ifdef CONFIG_NFS_FSCACHE?  If so, do you require no
> > > >>>> extra size be added to nfs_inode?
> > > >>>>
> > > >>>> @@ -204,9 +208,11 @@ struct nfs_inode {
> > > >>>>       __u64 write_io;
> > > >>>>       __u64 read_io;
> > > >>>> #ifdef CONFIG_NFS_FSCACHE
> > > >>>> -       struct fscache_cookie   *fscache;
> > > >>>> -#endif
> > > >>>> +       struct netfs_inode      netfs; /* netfs context and VFS inode
> > > >>>> */
> > > >>>> +#else
> > > >>>>       struct inode            vfs_inode;
> > > >>>> +#endif
> > > >>>> +
> > > >>>
> > > >>> Ideally, I'd prefer no extra size. I can live with it up to a certain
> > > >>> point, however for now NFS is not unconditionally opting into the netfs
> > > >>> project. If we're to ever do that, then I want to see streamlined code
> > > >>> for the standard I/O case.
> > > >>>
> > > >> Ok and understood about standard I/O case.
> > > >>
> > > >> I was thinking how we might not increase the size, but I don't think
> > > >> I can make it work.
> > > >>
> > > >> I thought we could change to something like the below, without an
> > > >> embedded struct inode:
> > > >>
> > > >> @@ -204,9 +208,11 @@ struct nfs_inode {
> > > >>       __u64 write_io;
> > > >>       __u64 read_io;
> > > >> #ifdef CONFIG_NFS_FSCACHE
> > > >> -       struct fscache_cookie   *fscache;
> > > >> -#endif
> > > >> +       struct netfs_inode      *netfs; /* netfs context and VFS inode */
> > > >> +#else
> > > >>       struct inode            vfs_inode;
> > > >> +#endif
> > > >> +
> > > >>
> > > >> Then I would need to alloc/free a netfs_inode at the time of
> > > >> nfs_inode initiation.  Unfortunately this has the issue that the NFS_I()
> > > >> macro cannot work, because it requires an embedded "struct inode"
> > > >> due to "container_of" use:
> > > >>
> > > >> +#ifdef CONFIG_NFS_FSCACHE
> > > >> +static inline struct inode *VFS_I(struct nfs_inode *nfsi)
> > > >> +{
> > > >> +       return &nfsi->netfs.inode;
> > > >> +}
> > > >> +static inline struct nfs_inode *NFS_I(const struct inode *inode)
> > > >> +{
> > > >> +       return container_of(inode, struct nfs_inode, netfs.inode);
> > > >> +}
> > > >> +#else
> > > >> +static inline struct inode *VFS_I(struct nfs_inode *nfsi)
> > > >> +{
> > > >> +       return &nfsi->vfs_inode;
> > > >> +}
> > > >> static inline struct nfs_inode *NFS_I(const struct inode *inode)
> > > >> {
> > > >>       return container_of(inode, struct nfs_inode, vfs_inode);
> > > >> }
> > > >> +#endif
> > > >>
> > > >>
> > > >
> > > > Actually Trond maybe we can achieve a "0 length increase" of
> > > > nfs_inode if dhowells would take a patch to modify the definition
> > > > of struct netfs_inode and netfs_inode_init(), something like the WIP
> > > > patch below.  What do you think?
> > >
> > > That works for me.
> > >
> > > >
> > > > I think maybe this could be a follow-on patch and if you/dhowells
> > > > think it's an ok idea I can try to work out what is needed across
> > > > the tree.  I thought about it more and I kinda agree that in the
> > > > case for NFS where fscache is "configured but not enabled",
> > > > then even though we're only adding 24 bytes to the nfs_inode
> > > > each time, it will add up so it is worth at least a discussion.
> > > >
> > > > diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> > > > index f2402ddeafbf..195714f1c355 100644
> > > > --- a/include/linux/netfs.h
> > > > +++ b/include/linux/netfs.h
> > > > @@ -118,11 +118,7 @@ enum netfs_io_source {
> > > > typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_error,
> > > >                                     bool was_async);
> > > >
> > > > -/*
> > > > - * Per-inode context.  This wraps the VFS inode.
> > > > - */
> > > > -struct netfs_inode {
> > > > -       struct inode            inode;          /* The VFS inode */
> > > > +struct netfs_info {
> > > >       const struct netfs_request_ops *ops;
> > > > #if IS_ENABLED(CONFIG_FSCACHE)
> > > >       struct fscache_cookie   *cache;
> > > > @@ -130,6 +126,14 @@ struct netfs_inode {
> > > >       loff_t                  remote_i_size;  /* Size of the remote file */
> > > > };
> > > >
> > > > +/*
> > > > + * Per-inode context.  This wraps the VFS inode.
> > > > + */
> > > > +struct netfs_inode {
> > > > +       struct inode            inode;          /* The VFS inode */
> > > > +       struct netfs_info       *netfs;         /* Rest of netfs data */
> > > > +};
> > > > +
> > > > /*
> > > > * Resources required to do operations on a cache.
> > > > */
> > > > @@ -312,10 +316,12 @@ static inline struct netfs_inode
> > > > *netfs_inode(struct inode *inode)
> > > > static inline void netfs_inode_init(struct netfs_inode *ctx,
> > > >                                   const struct netfs_request_ops *ops)
> > > > {
> > > > -       ctx->ops = ops;
> > > > -       ctx->remote_i_size = i_size_read(&ctx->inode);
> > > > +       ctx->netfs = kzalloc(sizeof(struct netfs_info)), GFP_KERNEL);
> > > > +       /* FIXME: Check for NULL */
> > > > +       ctx->netfs->ops = ops;
> > > > +       ctx->netfs->remote_i_size = i_size_read(&ctx->inode);
> > > > #if IS_ENABLED(CONFIG_FSCACHE)
> > > > -       ctx->cache = NULL;
> > > > +       ctx->netfs->cache = NULL;
> > > > #endif
> > > > }
> > > >
> > > >
> > > >
> > > >>
> > > >>>>
> > > >>>>
> > > >>>> Are you ok with the stub functions which are placed in fscache.h, and
> > > >>>> when CONFIG_NFS_FSCACHE is not set, become either a no-op
> > > >>>> or a 1-liner (nfs_netfs_readpage_release)?
> > > >>>>
> > > >>>> #else /* CONFIG_NFS_FSCACHE */
> > > >>>> +static inline void nfs_netfs_inode_init(struct nfs_inode *nfsi) {}
> > > >>>> +static inline void nfs_netfs_initiate_read(struct nfs_pgio_header
> > > >>>> *hdr) {}
> > > >>>> +static inline void nfs_netfs_read_completion(struct nfs_pgio_header
> > > >>>> *hdr) {}
> > > >>>> +static inline void nfs_netfs_readpage_release(struct nfs_page *req)
> > > >>>> +{
> > > >>>> +       unlock_page(req->wb_page);
> > > >>>> +}
> > > >>>> static inline void nfs_fscache_release_super_cookie(struct
> > > >>>> super_block *sb) {}
> > > >>>> static inline void nfs_fscache_init_inode(struct inode *inode) {}
> > > >>>>
> > > >>>>
> > > >>>> Do you object to the below?  If so, then do you want
> > > >>>> #ifdef CONFIG_NFS_FSCACHE here?
> > > >>>>
> > > >>>> -- a/fs/nfs/inode.c
> > > >>>> +++ b/fs/nfs/inode.c
> > > >>>> @@ -2249,6 +2249,8 @@ struct inode *nfs_alloc_inode(struct
> > > >>>> super_block *sb)
> > > >>>> #ifdef CONFIG_NFS_V4_2
> > > >>>>       nfsi->xattr_cache = NULL;
> > > >>>> #endif
> > > >>>> +       nfs_netfs_inode_init(nfsi);
> > > >>>> +
> > > >>>>       return VFS_I(nfsi);
> > > >>>> }
> > > >>>> EXPORT_SYMBOL_GPL(nfs_alloc_i
> > > >>>> node);
> > > >>>>
> > > >>>>
> > > >>>> Do you object to the changes in fs/nfs/read.c?  Specifically,
> > > >>>> how about the below calls to netfs from nfs_read_folio and
> > > >>>> nfs_readahead into equivalent netfs calls?  So when
> > > >>>> NFS_CONFIG_FSCACHE is set, but fscache is not enabled
> > > >>>> ('fsc' not on mount), these netfs functions do immediately call
> > > >>>> netfs_alloc_request().  But I wonder if we could simply add a
> > > >>>> check to see if fscache is enabled on the mount, and skip
> > > >>>> over to satisfy what you want.  Am I understanding what you
> > > >>>> want?
> > > >>>
> > > >>> Quite frankly, I'd prefer that we just split out the functionality that
> > > >>> is needed from the netfs code so that it can be optimised. However I'm
> > > >>> not interested enough in the cachefs functionality to work on that
> > > >>> myself. ...and as I indicated above, I might be OK with opting into the
> > > >>> netfs project, once the overhead can be made to disappear.
> > > >>>
> > > >> Understood.
> > > >>
> > > >> If you think it makes more sense, I can move some of the nfs_netfs_*
> > > >> functions into a netfs.c file as a starting point.  Or that can maybe
> > > >> be done in a future patchset?
> > > >>
> > > >> For now I was equating netfs and fscache together so we can
> > > >> move on from the much older and single-page limiting fscache
> > > >> interface that is likely to go away soon.
> > > >>
> > > >>>>
> > > >>>> @@ -355,6 +343,10 @@ int nfs_read_folio(struct file *file, struct
> > > >>>> folio *folio)
> > > >>>>       if (NFS_STALE(inode))
> > > >>>>               goto out_unlock;
> > > >>>>
> > > >>>> +       ret = nfs_netfs_read_folio(file, folio);
> > > >>>> +       if (!ret)
> > > >>>> +               goto out;
> > > >>>> +
> > > >>>>
> > > >>>> @@ -405,6 +399,10 @@ void nfs_readahead(struct readahead_control
> > > >>>> *ractl)
> > > >>>>       if (NFS_STALE(inode))
> > > >>>>               goto out;
> > > >>>>
> > > >>>> +       ret = nfs_netfs_readahead(ractl);
> > > >>>> +       if (!ret)
> > > >>>> +               goto out;
> > > >>>> +
> > > >>>>
> > > >> The above wrappers should prevent any additional overhead when fscache
> > > >> is not enabled.  As far as I know these work to avoid calling netfs
> > > >> when 'fsc' is not on the mount.
> > > >>
> > > >>>>
> > > >>>> And how about these calls from different points in the read
> > > >>>> path to the earlier mentioned stub functions?
> > > >>>>
> > > >>>> @@ -110,20 +110,13 @@ EXPORT_SYMBOL_GPL(nfs_pageio_reset_read_mds);
> > > >>>>
> > > >>>> static void nfs_readpage_release(struct nfs_page *req, int error)
> > > >>>> {
> > > >>>> -       struct inode *inode = d_inode(nfs_req_openctx(req)->dentry);
> > > >>>>       struct page *page = req->wb_page;
> > > >>>>
> > > >>>> -       dprintk("NFS: read done (%s/%llu %d@%lld)\n", inode->i_sb-
> > > >>>>> s_id,
> > > >>>> -               (unsigned long long)NFS_FILEID(inode), req->wb_bytes,
> > > >>>> -               (long long)req_offset(req));
> > > >>>> -
> > > >>>>       if (nfs_error_is_fatal_on_server(error) && error != -
> > > >>>> ETIMEDOUT)
> > > >>>>               SetPageError(page);
> > > >>>> -       if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE)) {
> > > >>>> -               if (PageUptodate(page))
> > > >>>> -                       nfs_fscache_write_page(inode, page);
> > > >>>> -               unlock_page(page);
> > > >>>> -       }
> > > >>>> +       if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE))
> > > >>>> +               nfs_netfs_readpage_release(req);
> > > >>>> +
> > > >>>
> > > >>> I'm not seeing the value of wrapping unlock_page(), no... That code is
> > > >>> going to need to change when we move it to use folios natively anyway.
> > > >>>
> > > >> Ok, how about I make it conditional on whether fscache is configured
> > > >> and enabled then, similar to the nfs_netfs_read_folio() and
> > > >> nfs_netfs_readahead()?  Below is what that would look like.
> > > >> I could inline the code in nfs_netfs_readpage_release() if you
> > > >> think it would be clearer.
> > > >>
> > > >> static void nfs_readpage_release(struct nfs_page *req, int error)
> > > >> {
> > > >>       struct page *page = req->wb_page;
> > > >>
> > > >>       if (nfs_error_is_fatal_on_server(error) && error != -ETIMEDOUT)
> > > >>               SetPageError(page);
> > > >>       if (nfs_page_group_sync_on_bit(req, PG_UNLOCKPAGE))
> > > >> #ifndef CONFIG_NFS_FSCACHE
> > > >>               unlock_page(req->wb_page);
> > > >> #else
> > > >>               nfs_netfs_readpage_release(req);
> > > >> #endif
> > > >>       nfs_release_request(req);
> > > >> }
> > > >>
> > > >>
> > > >> void nfs_netfs_readpage_release(struct nfs_page *req)
> > > >> {
> > > >>   struct inode *inode = d_inode(nfs_req_openctx(req)->dentry);
> > > >>
> > > >>   /*
> > > >>    * If fscache is enabled, netfs will unlock pages.
> > > >>    */
> > > >>   if (netfs_inode(inode)->cache)
> > > >>       return;
> > > >>
> > > >>   unlock_page(req->wb_page);
> > > >> }
> > > >>
> > > >>
> > > >>>>       nfs_release_request(req);
> > > >>>> }
> > > >>>>
> > > >>>> @@ -177,6 +170,8 @@ static void nfs_read_completion(struct
> > > >>>> nfs_pgio_header *hdr)
> > > >>>>               nfs_list_remove_request(req);
> > > >>>>               nfs_readpage_release(req, error);
> > > >>>>       }
> > > >>>> +       nfs_netfs_read_completion(hdr);
> > > >>>> +
> > > >>>> out:
> > > >>>>       hdr->release(hdr);
> > > >>>> }
> > > >>>> @@ -187,6 +182,7 @@ static void nfs_initiate_read(struct
> > > >>>> nfs_pgio_header *hdr,
> > > >>>>                             struct rpc_task_setup *task_setup_data,
> > > >>>> int how)
> > > >>>> {
> > > >>>>       rpc_ops->read_setup(hdr, msg);
> > > >>>> +       nfs_netfs_initiate_read(hdr);
> > > >>>>       trace_nfs_initiate_read(hdr);
> > > >>>> }
> > > >>>>
> > > >>>>
> > > >>>> Are you ok with these additions?  Something like this would
> > > >>>> be required in the case of fscache configured and enabled,
> > > >>>> because we could have some of the data in a read in
> > > >>>> fscache, and some not.  That is the reason for the netfs
> > > >>>> design, and why we need to be able to call the normal
> > > >>>> NFS read IO path (netfs calls into issue_read, and we call
> > > >>>> back via netfs_subreq_terminated)?
> > > >>>>
> > > >>>> @@ -101,6 +101,9 @@ struct nfs_pageio_descriptor {
> > > >>>>       struct pnfs_layout_segment *pg_lseg;
> > > >>>>       struct nfs_io_completion *pg_io_completion;
> > > >>>>       struct nfs_direct_req   *pg_dreq;
> > > >>>> +#ifdef CONFIG_NFS_FSCACHE
> > > >>>> +       void                    *pg_netfs;
> > > >>>> +#endif
> > > >>>>
> > > >>>> @@ -1619,6 +1619,9 @@ struct nfs_pgio_header {
> > > >>>>       const struct nfs_rw_ops *rw_ops;
> > > >>>>       struct nfs_io_completion *io_completion;
> > > >>>>       struct nfs_direct_req   *dreq;
> > > >>>> +#ifdef CONFIG_NFS_FSCACHE
> > > >>>> +       void                    *netfs;
> > > >>>> +#endif
> > > >>>>
> > > >>>>
> > > >>>> And these additions to pagelist.c?
> > > >>>>
> > > >>>> @@ -68,6 +69,10 @@ void nfs_pgheader_init(struct
> > > >>>> nfs_pageio_descriptor *desc,
> > > >>>>       hdr->good_bytes = mirror->pg_count;
> > > >>>>       hdr->io_completion = desc->pg_io_completion;
> > > >>>>       hdr->dreq = desc->pg_dreq;
> > > >>>> +#ifdef CONFIG_NFS_FSCACHE
> > > >>>> +       if (desc->pg_netfs)
> > > >>>> +               hdr->netfs = desc->pg_netfs;
> > > >>>> +#endif
> > > >>>
> > > >>> Why the conditional?
> > > >>>
> > > >> Not really needed and I was thinking of removing it, so I'll do that.
> > > >>
> > > >>>>
> > > >>>>
> > > >>>> @@ -846,6 +851,9 @@ void nfs_pageio_init(struct nfs_pageio_descriptor
> > > >>>> *desc,
> > > >>>>       desc->pg_lseg = NULL;
> > > >>>>       desc->pg_io_completion = NULL;
> > > >>>>       desc->pg_dreq = NULL;
> > > >>>> +#ifdef CONFIG_NFS_FSCACHE
> > > >>>> +       desc->pg_netfs = NULL;
> > > >>>> +#endif
> > > >>>>
> > > >>>>
> > > >>>> @@ -1360,6 +1369,9 @@ int nfs_pageio_resend(struct
> > > >>>> nfs_pageio_descriptor *desc,
> > > >>>>
> > > >>>>       desc->pg_io_completion = hdr->io_completion;
> > > >>>>       desc->pg_dreq = hdr->dreq;
> > > >>>> +#ifdef CONFIG_NFS_FSCACHE
> > > >>>> +       desc->pg_netfs = hdr->netfs;
> > > >>>> +#endif
> > > >>>
> > > >>> Those all need wrapper functions instead of embedding #ifdefs.
> > > >>>
> > > >> Ok.
> > > >>
> > > >>
> > > >>
> > > >>>>
> > > >>>>
> > > >>>>> My expectation is that the standard I/O path should have minimal
> > > >>>>> overhead, and should certainly not increase the overhead that we
> > > >>>>> already have. Will this be addressed in future iterations of these
> > > >>>>> patches?
> > > >>>>>
> > > >>>>
> > > >>>> I will do what I can to satisfy what you want, either by fixing up
> > > >>>> this patch or follow-on patches.  Hopefully the above questions
> > > >>>> will clarify the next steps.
> > > >>>>
> > > >>>
> > > >>> --
> > > >>> Trond Myklebust
> > > >>> Linux NFS client maintainer, Hammerspace
> > > >>> trond.myklebust@hammerspace.com
> > >
> > >
> > >
> > > Trond Myklebust
> > > CTO, Hammerspace Inc
> > > 1900 S Norfolk St, Suite 350 - #45
> > > San Mateo, CA 94403
> > >
> > > www.hammer.space
> > >
> > >
> >
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

