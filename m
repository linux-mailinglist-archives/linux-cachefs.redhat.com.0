Return-Path: <linux-cachefs+bncBCHIDX6I2QHBBYWD36WQMGQE5W5DALY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id A29548410CF
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 18:35:31 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42a3cb410f9sf61990291cf.2
        for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 09:35:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706549730; cv=pass;
        d=google.com; s=arc-20160816;
        b=IkMC7VuD2eMvncmF082Q70YDLHjUtg3PQEENQlYXX1Z41UdOPUoARTqET55g9b6x4L
         2PZB9Q3TchTTgBcs4c6N5TbptTNIhW1jdwzdX/i6TO5u3ir17LLxpFl2r6ZWnK+uNbx3
         86+jXqSBBzlFnIQBUp2+NzVmmZUf5pf5n8e0z1Q7V/7m3cg16EPaeID1R0QxYOjJA9AM
         jH82zAOeZXPFv/Ym1h+9mnU7Ed6Q5L/AwTKuuyxLXPBXhH7dqmVciuN3IV/rhtxf7ref
         VCVuMaaO17Jqqweo3JHXp72LmWVN1SgaJWPQ0n7xVELvppb2qcK7vSFjH2HjTwVBDlzk
         HW5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :delivered-to;
        bh=GFntpSO7TMOSk62xWBzuue2mZpHVorsVZLw9za2Yn8k=;
        fh=QVx4Ed7Gwmsc5RO9w5tH40rmTC5kTNaW99Fwoemd6TY=;
        b=n2J6aJ5ciCApmj0F2QRYOTOoz7W2NQUIjgP8QFvuV909a4+kWE8U9IpLMOlWyxMEP9
         o4oKuMLfciAXwj3ra9duRDVt1N/J3gkPDn2unPhsPaXNEYT9YvT4+rTkhdJ8/hyVjPFt
         6nxhocNiQhEcGmNFjiDd5ZQO8zYBNTar+PY53XNmAieA3ruDWChxmfbBGagqsuKLVH5u
         WzYz7duCgUlk2dLEljgpVesOKyYmRlfMAmKBPNYxEKXjPH1A2OgDYT+mjCQYf7WkWNLu
         f5js4G6TJZT1SIZ9PU+h/Z5Ib6ZKopTvY6q4hyiiGS2laCod3amrxGBftmffBKFgBopK
         t0xg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of dwysocha@redhat.com designates 209.85.161.70 as permitted sender) smtp.mailfrom=dwysocha@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549730; x=1707154530;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFntpSO7TMOSk62xWBzuue2mZpHVorsVZLw9za2Yn8k=;
        b=L6krU26rleIeNWZaX5vyaoFZLMhiIwvcBmp5kS7K+rD7DVJZBec8DYyIUOoFjwmAqN
         DLZ73Q/QwgN9HfCLn+XkmI5KVwax0YeAfD0RuADYb1p8/6BetRQyvFKe8QGbK2GWOWcl
         zXt3PhgYpePyYk+PqBjT9XlIOwr4WNsEsdmpzShTAfwNpp8N0tQHIAf37DcE3sUmfoPI
         14ot3dVdiBxr32mLwEtppMgItSzsQtYZVpZ0Z/OdZFgBLnMoIV0qf3QgS3Qlr7o1rKt4
         agnm7/nl84/fQWvgtcdeSZa2r/kfV2/9ooz2995MNxkwi9ng731vpuSs1jQrLueRMGmp
         r6tg==
X-Gm-Message-State: AOJu0Ywsls1/3m3aOJ7xKPIl9rpAIyPNDyaYMezarATjINVHNbVcWMvD
	vAJKYtN/cIqD0A7nKn8TL1dLWfcPHETGq2BtSnDQ7q7T7nO1WD3gsdkoX6Dlq9A=
X-Google-Smtp-Source: AGHT+IF6eld+gdtZI+rkoMNuKQXWo6jVPHKBM5h2BM2S3+cEucpSsM2csGOuzjGKxR0FAqSbbDMFzQ==
X-Received: by 2002:a05:622a:1d5:b0:42a:b04d:8695 with SMTP id t21-20020a05622a01d500b0042ab04d8695mr854689qtw.66.1706549730484;
        Mon, 29 Jan 2024 09:35:30 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a84:b0:42a:b16a:e0a9 with SMTP id
 s4-20020a05622a1a8400b0042ab16ae0a9ls367234qtc.0.-pod-prod-02-us; Mon, 29 Jan
 2024 09:35:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a1:b0:783:f753:1af6 with SMTP id bi33-20020a05620a31a100b00783f7531af6mr4019379qkb.12.1706549729841;
        Mon, 29 Jan 2024 09:35:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706549729; cv=none;
        d=google.com; s=arc-20160816;
        b=QcdfCKwgalN2wFptqa6+/Aze1+HvXmEH8Zr9BI5F+wK+9RDdJtwNWLHpizTEVieOIg
         ptQYz66Iz1llXUihVIXHE75qMiWHllSYC35WdMZLY2VaA5Jcaf48KUWUzNuCPprptHwm
         yoBr6d1UX5Z784JjoOxt+TJK8m6q5PcLM3vxA2w4hBz3MYEzfBtw2TRPrmXS4+bkU8Hn
         Hb/aix/9T0X0pyJppj11J3bdVFB1RiW1Hm2bftcJBNDJ9Wsu8+yjfRmmH8trHjyuk/gq
         jf/umEMAbRSa2YmCVyo1UfqbPkmkUwGS7wHdk4BNAxuc1U5PpKOSferE21nFRlbOGJEG
         TC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:delivered-to;
        bh=pNnV6qllixKii1cmzBKiZvBaPVF6lZz0W+h3Gyf7y6E=;
        fh=QVx4Ed7Gwmsc5RO9w5tH40rmTC5kTNaW99Fwoemd6TY=;
        b=huzKtt+TDhUvWo5WkmvyBqrwriESICKD2ZH4Kv/xWPoG93dbBTvUq1R+H9JGFSXisV
         vjFEHDE7PEY4XjW4hcPIElV813hG13r4ZRU8AuqdLQLF9wNB57ipB4iP/sr1gyG7zXnd
         AzP+0pDIXZoyelp7/mj8oAuFEGZFdrjVkl5rsgPeqEaTj7Sq1gD/KwW8SGWP7Lc+YgTB
         zHImhd4S+nxIFk5K7CV9MfEWyXgtFjii2BlJOuRuhWpgsGe4bpN25DjmlOqPuJwaQ6+Q
         MzzZDVq6utIon3xFUyC1f+Ks/NQFnqTyUDlLZ+iuww7asBClxmhoqZbU1FcbDW7jTC95
         oSew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dwysocha@redhat.com designates 209.85.161.70 as permitted sender) smtp.mailfrom=dwysocha@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id u9-20020a05620a454900b007840529eb55si1092549qkp.773.2024.01.29.09.35.29
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:35:29 -0800 (PST)
Received-SPF: pass (google.com: domain of dwysocha@redhat.com designates 209.85.161.70 as permitted sender) client-ip=209.85.161.70;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-HP4TbbshNm2JSWo1ab8NTg-1; Mon, 29 Jan 2024 12:35:28 -0500
X-MC-Unique: HP4TbbshNm2JSWo1ab8NTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB7AE8350D6
	for <linux-cachefs@gapps.redhat.com>; Mon, 29 Jan 2024 17:35:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E837C157; Mon, 29 Jan 2024 17:35:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1CC5494
	for <linux-cachefs@redhat.com>; Mon, 29 Jan 2024 17:35:27 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1542185A782
	for <linux-cachefs@redhat.com>; Mon, 29 Jan 2024 17:35:27 +0000 (UTC)
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-VGbvF6SAOtyMqRyv1f2rsQ-1; Mon, 29 Jan 2024 12:35:26 -0500
X-MC-Unique: VGbvF6SAOtyMqRyv1f2rsQ-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5963251664cso2956548eaf.0
        for <linux-cachefs@redhat.com>; Mon, 29 Jan 2024 09:35:26 -0800 (PST)
X-Received: by 2002:a05:6358:9149:b0:175:c7bb:5bbb with SMTP id r9-20020a056358914900b00175c7bb5bbbmr3688564rwr.42.1706549724397;
        Mon, 29 Jan 2024 09:35:24 -0800 (PST)
X-Received: by 2002:a05:6358:9149:b0:175:c7bb:5bbb with SMTP id
 r9-20020a056358914900b00175c7bb5bbbmr3688556rwr.42.1706549724169; Mon, 29 Jan
 2024 09:35:24 -0800 (PST)
MIME-Version: 1.0
References: <20240129154750.1245317-1-dwysocha@redhat.com> <1526807.1706548521@warthog.procyon.org.uk>
In-Reply-To: <1526807.1706548521@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 29 Jan 2024 12:34:47 -0500
Message-ID: <CALF+zOm9QBkf3PbchuVzkgYW1aEJWFFQ5JF0Y-_6BbPJke8CHw@mail.gmail.com>
Subject: Re: [PATCH] NFS: Fix nfs_netfs_issue_read() xarray locking for
 writeback interrupt
To: David Howells <dhowells@redhat.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, 
	Trond Myklebust <trond.myklebust@hammerspace.com>, Jeff Layton <jlayton@kernel.org>, 
	linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: dwysocha@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of dwysocha@redhat.com designates 209.85.161.70 as permitted sender) smtp.mailfrom=dwysocha@redhat.com
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

On Mon, Jan 29, 2024 at 12:15=E2=80=AFPM David Howells <dhowells@redhat.com=
> wrote:
>
> Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> > -     xas_lock(&xas);
> > +     xas_lock_irqsave(&xas, flags);
> >       xas_for_each(&xas, page, last) {
>
> You probably want to use RCU, not xas_lock().  The pages are locked and s=
o
> cannot be evicted from the xarray.
>

I tried RCU originally and ran into a problem because NFS can schedule
(see comment on line 328 below)

326         xas_lock_irqsave(&xas, flags);
327         xas_for_each(&xas, page, last) {
328                 /* nfs_read_add_folio() may schedule() due to pNFS
layout and other RPCs  */
329                 xas_pause(&xas);
330                 xas_unlock_irqrestore(&xas, flags);
331                 err =3D nfs_read_add_folio(&pgio, ctx, page_folio(page)=
);
332                 if (err < 0) {
333                         netfs->error =3D err;
334                         goto out;
335                 }
336                 xas_lock_irqsave(&xas, flags);
337         }
338         xas_unlock_irqrestore(&xas, flags);

--=20
You received this message because you are subscribed to the Google Groups "=
linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.

