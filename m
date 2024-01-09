Return-Path: <linux-cachefs+bncBC3PHRO5QEGBBYX46WWAMGQEGTHKIXA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FCB828ABF
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 18:12:03 +0100 (CET)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-dbea39ed9f7sf3362174276.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 09:12:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704820323; cv=pass;
        d=google.com; s=arc-20160816;
        b=HxCV3gCMqG6tgsnkeuU1Xsz5iEe92FYC0oaYN12eLeDjbFWnq3L1+kgkKIHgWjjm89
         K9b5RU5o6JihG7CPWcSMXSURwpFMKHx+/hU/v1tJLV1iv66IW76rlWrCQSVXR5gjXTJ+
         2+a/BWiNphL22QTUdTrmDa2G4BbU25oSuSxdN1r5VIO3r1YbV0OWs4MVsfJ89/i6KsfJ
         5Z92HSkuHwJR3vWgT3f7BGZloke5mrOjL7aIsWXFxFa1cCZonUnBIOJWFkrPpcTcLdeb
         Z9O4qRar1S1B72+VV5f1XXWFS/v0Cvh9/ougqSR/z8b10GxxULhlwryfVMD3WstDDKCf
         IbOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :delivered-to;
        bh=6gWlgUthayYvkWhtqFPBbmmmNOVDw7o+JrAtFt+7WLc=;
        fh=GwV7kb8HBF3D6tAubKMYcK/qFOIo5Uol1YsSzOG9D2w=;
        b=x44zxlUsoun8HBthhcFT29u3S2FfKanWAdcDhpGFsKd1oJAwSiE+qhlmgf04zD+/Lj
         iJjA0H81cKM0nLZ2a48xQRwwuHclHDouUp7+1kCbvbq3zPHS6ZgiviBoHCrtXhUl1mHy
         3/Y6SkC/pNMAIUhYjiulq6oNYSiTp4+nhYXzb5blKwg8lCPvHhsWLL+Tan2HsCqsIQdq
         A/+Le76kmKri5UDiwRBm1XU/J4y3oOHZn3WJwHIRL+SI1ReJry3r24XamDVOuD/t/VHG
         Szlnna9T1u6TPwK3f0n/0rx2Do43CFleLXrbRaT0JBGfSkY15qPbRm5akM3RwV2S2YGP
         EBMQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of marc.c.dionne@gmail.com designates 209.85.218.51 as permitted sender) smtp.mailfrom=marc.c.dionne@gmail.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704820323; x=1705425123;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gWlgUthayYvkWhtqFPBbmmmNOVDw7o+JrAtFt+7WLc=;
        b=txMNqhZWq+u0D+lDwNtoRiWF86gibq1QsVG+y+mYWWyfUTVC/FqcTfA13fVrbo7ouS
         4Sih6MWVEvP6ynGagR6JjWNsPzW9i7JA4Ma7ZKYvueflpo5/WAe1h+g5C9hlScBS71fk
         kj3hZmw2JH//ew3QaqPQfqQpGVx8qniBEdyxzNmHhc35B4kPXbgEmNtayXDz95G6E1ja
         5iK13GPIS/GZp1/bGSMd8gXj7iAP7Ce+CrHTFsmEHEph0j/HVkRfKJCizGTFKzveeUJo
         UEqE/pRbBpfrBRQA4LjdgaBmgL6OwJgZt6pl/D/HM1AsqGizwemhTbTlRtfviqWpNEKn
         oTbA==
X-Gm-Message-State: AOJu0YwlAB/cuywAXNhmses+0YdyhvgiOSWKNH16pV6vLG1cwUEH8wv9
	SSq6octFjg/XqfGSGX1DLNUT3GtuGm3+qQ==
X-Google-Smtp-Source: AGHT+IHsND1OhghwaEqpGZFUPBLUtVo/BoJSV2BRDO5RPbHobBDGPZAn/MdMXIrgKjSvMjKjxPiArA==
X-Received: by 2002:a25:abe5:0:b0:dbe:337e:4e1 with SMTP id v92-20020a25abe5000000b00dbe337e04e1mr3159500ybi.117.1704820322804;
        Tue, 09 Jan 2024 09:12:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:7497:0:b0:dbe:324e:991a with SMTP id p145-20020a257497000000b00dbe324e991als1541049ybc.2.-pod-prod-04-us;
 Tue, 09 Jan 2024 09:12:02 -0800 (PST)
X-Received: by 2002:a0d:dc83:0:b0:5e8:45b6:5b8a with SMTP id f125-20020a0ddc83000000b005e845b65b8amr4497076ywe.6.1704820321874;
        Tue, 09 Jan 2024 09:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704820321; cv=none;
        d=google.com; s=arc-20160816;
        b=pgiWDwgVVGkHBk3zznc5Y5jmlTpMwCfd/mEhH3WUk5D9wXhhjBYzoJg77NZSqSO20q
         NlIOZjjU9W2JjSaN9O2mjwqu7bqFNSEBw8PTbrvL3UQaAomN6LJKsPt4zYF7KcVmNLTl
         +Sb0SG9hig0phAr88kaRNMJor4O8p5ho/EfAgjDa1Pbipa3woTp1ZCM2J4U7QBo4WQZK
         2CZTAB4aZcO/kvSto7xHV1HIWQpRAzzCapiKJjdGmSIF+Bj42xoNwURpQ6zOoOHoTcFd
         Kew4/q2QgKb1vJsHo9QWiKmvE57rBqH4MgxuDmX+cEUDPadlbzeC796/SLlw0jtrqWfP
         q3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to;
        bh=74pgZ+nMyMyCi7Q0sf1ChPH+6TyfRgWiK4L8xKykjS8=;
        fh=GwV7kb8HBF3D6tAubKMYcK/qFOIo5Uol1YsSzOG9D2w=;
        b=kKUwquhT8q8szHSK27MmrdVMna5n73RSADl6lXbRDAAObKT+8iWto7KtK8NEcOpiK1
         UuIr+AhHOAHMGUdfFhqw/vWsRLYoPU100KpRh0NOIxnY+J5keGln7LeInPFggcET7WCa
         EJKDkHZWS5CZrEvuu071AeA14kwbcTeKc1g2+M3s/RgOjqhK18rsaOf7vbbRaWPcT5xT
         Q6/hn6jWicB01/g4QI5ItI8SPLl8YdNW0QFsJpB0+jTC07hYXzgscJKhDqDRekk0fI9s
         8ZueXgBqHGHRbcRlLv6WUmOS8TnNMDCBEugBP2rqo29haEIJECGNdTppeKAJxVM5yjJe
         fUcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of marc.c.dionne@gmail.com designates 209.85.218.51 as permitted sender) smtp.mailfrom=marc.c.dionne@gmail.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c191-20020a814ec8000000b005e2638205fdsi1159921ywb.191.2024.01.09.09.12.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 09:12:01 -0800 (PST)
Received-SPF: pass (google.com: domain of marc.c.dionne@gmail.com designates 209.85.218.51 as permitted sender) client-ip=209.85.218.51;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-ODupwN4LOtC9Pde_dJTMUQ-1; Tue,
 09 Jan 2024 12:11:59 -0500
X-MC-Unique: ODupwN4LOtC9Pde_dJTMUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6740380628F
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 17:11:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D108F36ED; Tue,  9 Jan 2024 17:11:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8F1C3C39
	for <linux-cachefs@redhat.com>; Tue,  9 Jan 2024 17:11:57 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A26EC857F8F
	for <linux-cachefs@redhat.com>; Tue,  9 Jan 2024 17:11:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-p1cQwdg7NmiuxMIYeIkclQ-1; Tue, 09 Jan 2024 12:11:55 -0500
X-MC-Unique: p1cQwdg7NmiuxMIYeIkclQ-1
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a27733ae1dfso360804766b.3;
        Tue, 09 Jan 2024 09:11:53 -0800 (PST)
X-Received: by 2002:a17:906:c9d7:b0:a29:447d:e940 with SMTP id hk23-20020a170906c9d700b00a29447de940mr308446ejb.286.1704820311917;
        Tue, 09 Jan 2024 09:11:51 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id u22-20020a170906781600b00a26af6131e0sm1229198ejm.7.2024.01.09.09.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 09:11:51 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-553ba2f0c8fso3672652a12.1;
        Tue, 09 Jan 2024 09:11:51 -0800 (PST)
X-Received: by 2002:a17:907:1c19:b0:a27:5397:74ed with SMTP id
 nc25-20020a1709071c1900b00a27539774edmr523050ejc.175.1704820311478; Tue, 09
 Jan 2024 09:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20240109112029.1572463-1-dhowells@redhat.com>
In-Reply-To: <20240109112029.1572463-1-dhowells@redhat.com>
From: "'Marc Dionne' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Date: Tue, 9 Jan 2024 13:11:39 -0400
X-Gmail-Original-Message-ID: <CAB9dFdt0haftd1LPo=_GmtcZvFR84w81eaARfUKW2KMSM5gxqg@mail.gmail.com>
Message-ID: <CAB9dFdt0haftd1LPo=_GmtcZvFR84w81eaARfUKW2KMSM5gxqg@mail.gmail.com>
Subject: Re: [PATCH 0/6] netfs, cachefiles: More additional patches
To: David Howells <dhowells@redhat.com>
Cc: Christian Brauner <christian@brauner.io>, Jeff Layton <jlayton@kernel.org>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Steve French <smfrench@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Paulo Alcantara <pc@manguebit.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Eric Van Hensbergen <ericvh@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, linux-cachefs@redhat.com, 
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: auristor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: marc.c.dionne@gmail.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of marc.c.dionne@gmail.com designates 209.85.218.51 as permitted
 sender) smtp.mailfrom=marc.c.dionne@gmail.com
X-Original-From: Marc Dionne <marc.dionne@auristor.com>
Reply-To: Marc Dionne <marc.dionne@auristor.com>
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

On Tue, Jan 9, 2024 at 7:20=E2=80=AFAM David Howells <dhowells@redhat.com> =
wrote:
>
> Hi Christian, Jeff, Gao,
>
> Here are some additional patches for my netfs-lib tree:
>
>  (1) Mark netfs_unbuffered_write_iter_locked() static as it's only used i=
n
>      the file in which it is defined.
>
>  (2) Display a counter for DIO writes in /proc/fs/netfs/stats.
>
>  (3) Fix the interaction between write-streaming (dirty data in
>      non-uptodate pages) and the culling of a cache file trying to write
>      that to the cache.
>
>  (4) Fix the loop that unmarks folios after writing to the cache.  The
>      xarray iterator only advances the index by 1, so if we unmarked a
>      multipage folio and that got split before we advance to the next
>      folio, we see a repeat of a fragment of the folio.
>
>  (5) Fix a mixup with signed/unsigned offsets when prepping for writing t=
o
>      the cache that leads to missing error detection.
>
>  (6) Fix a wrong ifdef hiding a wait.
>
> David
>
> The netfslib postings:
> Link: https://lore.kernel.org/r/20231013160423.2218093-1-dhowells@redhat.=
com/ # v1
> Link: https://lore.kernel.org/r/20231117211544.1740466-1-dhowells@redhat.=
com/ # v2
> Link: https://lore.kernel.org/r/20231207212206.1379128-1-dhowells@redhat.=
com/ # v3
> Link: https://lore.kernel.org/r/20231213152350.431591-1-dhowells@redhat.c=
om/ # v4
> Link: https://lore.kernel.org/r/20231221132400.1601991-1-dhowells@redhat.=
com/ # v5
> Link: https://lore.kernel.org/r/20240103145935.384404-1-dhowells@redhat.c=
om/ # added patches
>
> David Howells (6):
>   netfs: Mark netfs_unbuffered_write_iter_locked() static
>   netfs: Count DIO writes
>   netfs: Fix interaction between write-streaming and cachefiles culling
>   netfs: Fix the loop that unmarks folios after writing to the cache
>   cachefiles: Fix signed/unsigned mixup
>   netfs: Fix wrong #ifdef hiding wait
>
>  fs/cachefiles/io.c            | 18 +++++++++---------
>  fs/netfs/buffered_write.c     | 27 ++++++++++++++++++++++-----
>  fs/netfs/direct_write.c       |  5 +++--
>  fs/netfs/fscache_stats.c      |  9 ++++++---
>  fs/netfs/internal.h           |  8 ++------
>  fs/netfs/io.c                 |  2 +-
>  fs/netfs/stats.c              | 13 +++++++++----
>  include/linux/fscache-cache.h |  3 +++
>  include/linux/netfs.h         |  1 +
>  9 files changed, 56 insertions(+), 30 deletions(-)
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-cachefs@redhat.com" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-cachefs+unsubscribe@redhat.com.

This passes our kafs tests where a few of the issues fixed here had been se=
en.
I made the framework use 9p and no related issues were seen there either.

Tested-by: Marc Dionne <marc.dionne@auristor.com>

Marc

--=20
You received this message because you are subscribed to the Google Groups "=
linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.

