Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLVB72YAMGQE3F4T2HI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC68A7F16
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 11:04:47 +0200 (CEST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78edbede4b7sf103124085a.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 02:04:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713344686; cv=pass;
        d=google.com; s=arc-20160816;
        b=CBv3cqQ5MhwnJgCplAG99k3HefTdaEk0qZ6Wj9WvGgf561+hjNmj10FHN0HMScYI2r
         Nnue562+JMMcf+vrwpSAhs0pMmGXk3d7B3cx0XEARVy7/3fXn/3E0zGeaxNRXvG+el6s
         gn9vd0Ao2cEjhHAnhE7LbwuloWDMY7PYGSvReVDe3IFBMKB+Z9Ny//7k1nJyK3XHjnc8
         oxH3N1EYQPsz7SM9G9SBZajkd1ihVCv1ELjAm2V4ER5inI9n9C72u8cMhLudCACKO+L9
         VgbwHNRCus3w2aycN3T8xX4GO4Eyh99os89N7Mlgjk2+PPE9OaRkEJ9Bognfuccdt9ut
         FxxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=572pPtGQoBcj8B3Al3MvUbQ8yywGAHJiqJVCDSOB6L4=;
        fh=g+EqUci/Q/4Um5EvXXrRsN+Xb8d+gqRfo+6E/c/Ut+I=;
        b=Qecc9An5Ej1KyPz08SNvFGEVM9bY2FSdbRy5w500bj1AUg0mEVHdoEcQyuGlDJKwnj
         Py/c7/W5Lc+buCJCZbZMj/K1ybLlKRkM2Wp821jTAm9QihbtNKFZE8kMcXr9zcYjFuJu
         thTFVla4DVgUgwg6g3HFV0GvKn10jy8fw4mjWLVymKxdwuWykM8As9jiQlSxFCpwraDJ
         mHBr1AZm/KyMwT3Yu4fKKISVwzr7kpyp5iWVmi3+xmCqs3s7NxHXcJhTz68rgbzaZa0L
         VJu/GIjIyy1BVJVWd0XWoxzgLK1L83O5c4X+VES1i/+5H9p50QqrhBDYlj2hMcZHY0a1
         HT4Q==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713344686; x=1713949486;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=572pPtGQoBcj8B3Al3MvUbQ8yywGAHJiqJVCDSOB6L4=;
        b=kAHESS5/qMhYAmrPXKHknOiVmasqQzEg+7IMzXdMSZtPneoV4a1BmfkhxbKsKIhDXJ
         jhCVRrpDRM/J9u/a0Qx0lTzmkaZXkRDZL6i+SQ+3Mlmls6OdcON8nDgqSup6qSk0YlCJ
         xlriy4D4bM/Z7LeIaHeru8vBwZTxYJFRIQRLVjH+mHiKSsJAPKgpvI22b3H23S2+qrAN
         8k2+sREBIfA7bn8zD172Vm5Z2BK+4Ccwy/IcSuQZlDN2IHQYpQT3ISuA1QL070uNXCGG
         1BXyJPkcRBaeTfEQ71N4+8GXOJr5DGw9NL6bl3z00tT9uElP4dM7/PAbMUPqRcX6JFQ9
         RFxQ==
X-Forwarded-Encrypted: i=2; AJvYcCWsAd1EGFzVPz5asHxoYEztAxz/h7TmPuL1aATh+SNIYgRJLH7H+uDEPA4xXU+6x/w/h6TIAdissxpwoI1bfUdxvnuUp6Rh+TPPxFk=
X-Gm-Message-State: AOJu0Yy/aYFhVlXy1vCrxqyUp98rIW0tnClEJ4zCkUp0T94MSFiRkCc8
	C84C3csS1K9B6dL76vK5wNr1gQrB4pSYlCcTGm1ytvh25nFPUPyVp0X8B6Jwc/c=
X-Google-Smtp-Source: AGHT+IHzVYwrx8zsWKMNRalHg8dJ2nvQtr7Uu8VjLESgzRqe6Brx6291iMSpHI+nvWx2z4PQitz1JQ==
X-Received: by 2002:a05:6214:518b:b0:6a0:2562:cad with SMTP id kl11-20020a056214518b00b006a025620cadmr6199036qvb.8.1713344686311;
        Wed, 17 Apr 2024 02:04:46 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:20ad:b0:699:1044:f17a with SMTP id
 13-20020a05621420ad00b006991044f17als166150qvd.1.-pod-prod-00-us; Wed, 17 Apr
 2024 02:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2OkXYiK2zwLRcYavJhavAZdE+vXpjxjcf71FElxgDUiaE30VJs6Yz7cMh5O6pfB1r+iLmu9BjiMRQ0I5qgZaUh5oglW3nGso66Zd4nYY=
X-Received: by 2002:a05:620a:4010:b0:78d:4596:b77f with SMTP id h16-20020a05620a401000b0078d4596b77fmr8679771qko.18.1713344685564;
        Wed, 17 Apr 2024 02:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713344685; cv=none;
        d=google.com; s=arc-20160816;
        b=lVVBFe2Jld9Z8Os+TBeNSAdA6xpxD/chK3Z00PYrZcdNt6AIXoy/rLTvhbHeEgJhdK
         pOCFF8ckKn8uqPwAuC2cphxoMEi5U/Om1L7k1JrEOvevTfODlfknvmfr10bfs04UqAZl
         L/jjF3Bj/e4lphOM68H/TiMOC+qdxEuD346bSEK4HQoGX6tAi5dxycy9/QKQ+iUKU7FY
         p4y02fA5RSVtquJsFNyUos9MfUFWCBGW1LnHqh5F3GYibvBj3DaJdMhfR1nGxmyqnJL+
         IRLZZxZGDCshXQYXMbMxh8FAWslu13wr8rW0DVQNTnP2jnVFT5cHNt4Bdmyqqt1jF7wI
         w14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=l0o9cqWvopzRGIbQrWEpYy4RFrMHbVHwEFIkzoBARCg=;
        fh=6FzlfXiukpG/rTTSejP3Fenzg2i7OE7kqPGpOmlBYsI=;
        b=oZ+CILLPEZqimamhyyg/+1Mz7d1LETuLxWO/YUzy0YNXS8lHYF/hDveb6KME87ROBy
         yXk7Y76mtFkY+03JJ3O1XfHOZUZOfOMLKp7PesP72tMOHAvgS2e5AqjZlt8uJBBXJwcb
         jjlYymiPfODo3Xa+sxsuy215vXCy6QV2O1m4+jAtuFqzwn45q/IAaMK8vPshKIgvE7/0
         h9ePBHkLPn+ggXarUs95KL+5aEWhdMafC5hZpzkPCazfj+2mqqWh2/74feobpY9mRnY+
         aAhNb1S7scvnJasA1Td1P+a+oMmf3vo+LDE/K6kMrIqyhrahbKhxHCV1ckJ4mwhcrNOY
         GRNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id pi38-20020a05620a37a600b0078edc18da6esi8722281qkn.726.2024.04.17.02.04.45
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 02:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-8n4OkEIHOqqLxakQwH6Bcg-1; Wed, 17 Apr 2024 05:04:44 -0400
X-MC-Unique: 8n4OkEIHOqqLxakQwH6Bcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0B69811000
	for <linux-cachefs@gapps.redhat.com>; Wed, 17 Apr 2024 09:04:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CD2D04910C; Wed, 17 Apr 2024 09:04:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24BDC490DD;
	Wed, 17 Apr 2024 09:04:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <f555b324b79829d6fc63da0d05995ce337969f65.camel@kernel.org>
References: <f555b324b79829d6fc63da0d05995ce337969f65.camel@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-18-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
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
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/26] netfs: Fix writethrough-mode error handling
MIME-Version: 1.0
Date: Wed, 17 Apr 2024 10:04:19 +0100
Message-ID: <28314.1713344659@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <28313.1713344659.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Jeff Layton <jlayton@kernel.org> wrote:

> Should this be merged independently? It looks like a bug that's present
> now.

Yes.  I've just posted that as a separate fix for Christian to pick up.  I
still need to keep it in this set, though, until it is upstream.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

