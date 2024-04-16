Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4X47OYAMGQEOZKHQQI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4888A77E5
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 00:40:52 +0200 (CEST)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-610b96c8ca2sf80674147b3.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 16 Apr 2024 15:40:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713307251; cv=pass;
        d=google.com; s=arc-20160816;
        b=vxLDYVc+fTTcoehLRptzZyTNfRWdFgJRSnchu405IIAsfqIRdvg1vM7dAajDZENMqs
         y+tcTiFynnZdqXmGKZm4gogVKsfqJ/LHv9MB7t+oliy8qEzKWVB2lyw86o2f2xuRRZHA
         V0Ad5LrM6NaLz0yej/bTFgkOHbgwQ7R15DkK/Ma+hWXxT3VRDcx1ln7PXCRwwVlW1tCm
         0j35cZeqCD6luQy27DzrFOe/URty67M2TyOWWwdRUdteFdofMK8dQmPLlrQNvXohbM++
         5wcYP0QI5MvbvwHEcnGGWaE4L0epMSAXcYBt58GPzTXR37YQ/hLpKu+n6lm6IJ9bTyZI
         DRkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=LjGl2aun+GFjGH1kjR3Y17+1YW//j8HfEvDsGfN2v/8=;
        fh=32JpAJLnb3pDLPpMpHtQXH8vb+3volBD76ZOYNXbGMc=;
        b=QI9cdcohrB4HPtT9wB6d227WQnTxjx251S0A8XOdDZhhhCHzArjGhz1JTaZuJERVL1
         uPcK5YcBXgipESZT/uzswtqiGxF5ExXnDtjA/BGR7iMWvGrf0BT8MnJNIkvZj7flXPdx
         PVSrdcnYiYiKkj2NNZ6JZjWaEmV6PfZzVOiDU1ou7y1W4Am0oToutOMSyThPX47YhwzJ
         lOJLpAAbkQTekbnyZR+H6OGbTHcBm+TYMFAWG8D1NTU6dWf4I9+PoM8SsTwUOLfWEaUa
         tQwjQm0VS2BOTzI7jNHVj3pwjFXMnTCXhmmGPuCzvxhyW5C9iymmXY2eWevCuqAePy35
         J9lg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713307251; x=1713912051;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LjGl2aun+GFjGH1kjR3Y17+1YW//j8HfEvDsGfN2v/8=;
        b=cOQ+REUv55vJw6BGAmwL+BUicnSEkYwAXvhW2+UjJrGdE7Zp0QeAv2a6uO1unPP7SZ
         kIUfRrA6qvB3u++GdfCCtygXqCyLLhfzftMyrDM/g3YbmjPUSSlAJHBjqRNWxU2onxsR
         C3YoelcsnSBUPZpUNMR6ufsaKYZpzrMNBd7h4nZuA56o4d3kHK0lsTMT+HZAHbihzhGV
         rByxIJGEQ3BfhiK8xWoU/J4gah0gyYkgzGCIv9wJtrl3o/xLLhp03WhacMu48VaTRNt0
         +gufcscLhUYnv5HubaT+IowMCQxYZJPk0w1YPEMISmlFGRsRnlv1Sg5e0oyc71oGG/u8
         TOEQ==
X-Forwarded-Encrypted: i=2; AJvYcCUdQNq6F5ut+RFZQYTIDlvhmkFWLKgraNNueKfIUS69vZAZxvTlZbBp9behuZUmy1A8oMuHD5kIitWBFAiGNEtJDheURXUbh0Qj2g0=
X-Gm-Message-State: AOJu0YwT583CzzYOF3mj7ZRO3hCgxsP0Jzg9QzBQfWHS8PxK/h+aIbUs
	YVaOhjQKYm4LKGUwjVlfHxCp2IdbQOoDN4sRIG90LmnmmbD7AV5tNean8GGLtEY=
X-Google-Smtp-Source: AGHT+IFcV2JWWFo7jxryiQnTIP6Nl/XszDSneSh78nQXlVaXykE+PHEp2JliNHSaciB5zmjYu/xNJA==
X-Received: by 2002:a25:bc8b:0:b0:dcc:8f97:4c42 with SMTP id e11-20020a25bc8b000000b00dcc8f974c42mr14199737ybk.13.1713307250849;
        Tue, 16 Apr 2024 15:40:50 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:dfc2:0:b0:dcd:202d:6be7 with SMTP id w185-20020a25dfc2000000b00dcd202d6be7ls6886451ybg.0.-pod-prod-05-us;
 Tue, 16 Apr 2024 15:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1whPLs/KC19kgtpjUmGQy+uo9uYrK1YP5xR3luK/O1nIS1AauExVnfzKZJJYoSd7ao80ggKOn+CSvW54EzPEB6psWuxSaBAUzIdn6EZk=
X-Received: by 2002:a81:8b4b:0:b0:617:cb98:f9b2 with SMTP id e11-20020a818b4b000000b00617cb98f9b2mr9196282ywk.43.1713307250026;
        Tue, 16 Apr 2024 15:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713307250; cv=none;
        d=google.com; s=arc-20160816;
        b=wy985CkKWQq1mpAYIg0qDgBjxV9Mm2x5TUqdgiyVaymdySEj61MUYkUL2pMRa1V0eN
         s5dWQUqZzNwveAd/DlLjrSVvrhiqT9yER29wZr4p+ML9G4R2mFULeTFy5ek64ubIBKms
         yGGq6/ZbaubhTsqBcIBzTfcfVaIdxR2V3GQVt1hKZX0oEWr17m5L80R/wnYO2mx8PyOZ
         9TxbSoHj2rGTe9uuWalRQ32AzLNBT0H2OZKyZsRjf+GbmQg5JOziTg4K2zYXsMWeqTFZ
         CV+yU/qgmgaci5VkOZ/DmF2KKYhufnqdQo33L22GJKjFQavjlI1GJSPm4OLrZNXWdX2G
         kP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=N5nwDmbhe++pDB3bapq0vGCRdzBr3y4GS9c/nfTtZFY=;
        fh=BAxDz4NbjBStODtHW20n8+yZFfohjH7VZn0Cc1PhNb8=;
        b=hQs9uacFZNx6ogORQYXnrwEiCpbKk7YA2Xtjd0s/oghjbppdsvzyV6bZccEk6qYx0C
         bzew1XM/O3Rj10dcinyCvDOAeGFg3Cx3CkjM+0U0X8f1o7tmD9Dspz9/sHwfN6+Z1ddJ
         QzFKEjJl5o7KjiKEiKe2S05fSYmt3LeuZfEaMDu57fxClAqkjn+i8xEzLoKez01V9WdV
         hi7lUdCzhSDBwm0NfgPFv7HzcYjwziOw00wnyVl2WsevN7x9CJl2qg/Vm30+xKZumR1r
         wlgG36IkL7MtY2P50JiHpyifu22/4cIRJxBKfe7vVjtTQwGSdcruSSEGO6m+eLZnihVL
         hlqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id x26-20020a05620a14ba00b0078ec8d2127fsi11934358qkj.615.2024.04.16.15.40.49
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 15:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-PpSktRGyP4OPubL8EGwoCQ-1; Tue, 16 Apr 2024 18:40:48 -0400
X-MC-Unique: PpSktRGyP4OPubL8EGwoCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36B38800935
	for <linux-cachefs@gapps.redhat.com>; Tue, 16 Apr 2024 22:40:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 3321C51EF; Tue, 16 Apr 2024 22:40:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6583339DCA;
	Tue, 16 Apr 2024 22:40:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAH2r5msFoGAE79pS5bEt5T8a60LU82mdjNdpfe0bG4YpvY8t-g@mail.gmail.com>
References: <CAH2r5msFoGAE79pS5bEt5T8a60LU82mdjNdpfe0bG4YpvY8t-g@mail.gmail.com> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-2-dhowells@redhat.com> <39de1e2ac2ae6a535e23faccd304d7c5459054a2.camel@kernel.org> <2345944.1713186234@warthog.procyon.org.uk>
To: Steve French <smfrench@gmail.com>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Christian Brauner <christian@brauner.io>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
    Shyam Prasad N <nspmangalore@gmail.com>,
    Rohith Surabattula <rohiths.msft@gmail.com>
Subject: Re: [PATCH 01/26] cifs: Fix duplicate fscache cookie warnings
MIME-Version: 1.0
Date: Tue, 16 Apr 2024 23:40:39 +0100
Message-ID: <2754966.1713307239@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2754965.1713307239.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Steve French <smfrench@gmail.com> wrote:

> Should this be merged independently (and sooner? in rc5?)

It's already upstream through the cifs tree and I've dropped it from my
branch.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

