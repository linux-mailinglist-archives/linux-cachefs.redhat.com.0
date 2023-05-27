Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6C71389F
	for <lists+linux-cachefs@lfdr.de>; Sun, 28 May 2023 10:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685260950;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0xD8Y7veEpE2JiE8lv4wA6UempozK/7B1DnDZLmglso=;
	b=EWI24eYZHA2BMWtCZwe89UBpZDt0qHYw6phLgMQIex2xHmg0bbjWA1O654f581FD7Oa0JQ
	rq9cBm7K1k8ueh1atdAsecKpnn3PXrYktpQQF5UNQJWRJZjK8VZlMQpFkjcRZqQ7SHx0ZS
	TrXbS1ocRugD7/iaSUsz71StTO+cec0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-ktabR3p7OqWnDC8MUX03Zw-1; Sun, 28 May 2023 04:02:28 -0400
X-MC-Unique: ktabR3p7OqWnDC8MUX03Zw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D5338009F3;
	Sun, 28 May 2023 08:02:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0760D492B00;
	Sun, 28 May 2023 08:02:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEFAD19465B2;
	Sun, 28 May 2023 08:02:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8084E194658C for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 27 May 2023 12:21:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7093320296C8; Sat, 27 May 2023 12:21:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6710320296C6
 for <linux-cachefs@redhat.com>; Sat, 27 May 2023 12:21:01 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C81685A5A8
 for <linux-cachefs@redhat.com>; Sat, 27 May 2023 12:21:01 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2127.outbound.protection.outlook.com [40.107.102.127]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-mLX_rXjQPziCP_VHiHYO6Q-1; Sat, 27 May 2023 08:20:58 -0400
X-MC-Unique: mLX_rXjQPziCP_VHiHYO6Q-1
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SJ2PR13MB6143.namprd13.prod.outlook.com (2603:10b6:a03:4f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Sat, 27 May
 2023 12:20:54 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6%3]) with mapi id 15.20.6433.018; Sat, 27 May 2023
 12:20:54 +0000
Date: Sat, 27 May 2023 14:20:46 +0200
From: Simon Horman <simon.horman@corigine.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <ZHH1nqZWOGzxlidT@corigine.com>
References: <20230526143104.882842-1-dhowells@redhat.com>
 <20230526143104.882842-2-dhowells@redhat.com>
In-Reply-To: <20230526143104.882842-2-dhowells@redhat.com>
X-ClientProxiedBy: AM0PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:208:1::25) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SJ2PR13MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2b2c9e-1703-484f-3077-08db5eacd16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: gnQJUwfhWb/6yyHot4adOrlymOrpRdyALlTpKkHNw0L5hGfD64UqALPIfDNR6qnTlReIBXaLUdBFHiUd6nLefz3RmevdwCCZzXOxbVgZB+v+9hOIwGINzawt2LwHW+QNdgbhUHfeNxy1qZrBqIUrj/zMEQ0Joze0I26MxgRJua1VyNbmtmCx190LwSlmN32NyLCwF5WgJsdaf9dbfoNtcW0kUoQ2if5G+FLKwL+K1aBx9UqdNOptrexuIRJ67/zdhNep82ayhupESnbDI45Z2PIV8BIOcR1AkMhAVtTPWvreuEEpeuXAOl0NBens6slHYI6q+19fqD3aYY6Fk8yTyMfy/l+Cj2z+H0+keXWBwvNsVfjNY1p3O58FJVRteCzw9N7Iu+eUoxiaRg2yQkIMfxdHpk5VcGxwkrTkzIYhuWm6YdKDU8VfPo9B4qaBySDfYFdgMQ27FjU1z37GOMiPU0zaIsxYQm76Sk2aY0n0VFxIHvYm1aQO03KSLBR7lmWNrkSAyH6bsDT+byMo/DXfLpLnaO1FXgDWiQE611U+fWW99haU0kQTzPnIxjkMHntU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39830400003)(366004)(396003)(136003)(346002)(376002)(451199021)(4326008)(86362001)(36756003)(186003)(8676002)(8936002)(41300700001)(83380400001)(6512007)(6506007)(2616005)(7416002)(5660300002)(54906003)(478600001)(6916009)(66946007)(66476007)(66556008)(316002)(6486002)(6666004)(38100700002)(44832011)(2906002);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k5f0cerJ30/hXpQz2q12q1QpqrKX/KBfnbgRDORHvUewXNM5RmdqdRQg2Hbn?=
 =?us-ascii?Q?/Ha485msQpZxB/WWJg1gh12VJAPyhLYawBCE7MGwnM3YfUnZBEGpWjVsQuTZ?=
 =?us-ascii?Q?/Qv/sqCQhJleQ+rZvyiw+E/AMfivjIX4vPLB4vLU+qpOuFhF9PwDZn+ox0LH?=
 =?us-ascii?Q?6NcnPUaGJvHCUU7aogUovg09ylYUbTRFJ/RkIn3OsesNRmNZPHHXdnR97kaX?=
 =?us-ascii?Q?lP4y8qnF7B47ekLVIMg7M104tHP1BxcsGP6ZuLrvWmpNIOl1/k4/eI5/vuhy?=
 =?us-ascii?Q?k5bB8P/Iz3c5mq7nTjLD3Sf/9ZLvuwMxZOP/xaqXldiMyzP/06wtSpjoTUy9?=
 =?us-ascii?Q?wf6MwsgnukoQLd6OfnGXqT8iw/qWDzizrY0K6ZeH3VS0HaMDHweQSNpHW6fx?=
 =?us-ascii?Q?YbQ1T9XQeuD3OP1HBiDZtLEGek9USF47aDp1BLSZRgOr5/vnKv/cnPAqzEP8?=
 =?us-ascii?Q?JuRBXXfRw1rhopnLqzo1so83K0L3Or+Zgr1IOzy1Gfb4RhSZxhRWnWTEeRkD?=
 =?us-ascii?Q?s/4mxuf9+7qV8AkdAnSgNVdVVigE7R5iTsz0aMkNd5PVtU37DqkKNd9o9UBa?=
 =?us-ascii?Q?tLcfIST+0HUoQ7CyvT+X4wJdnwyQ0nkB9X3S6QfPgvs3jbX7M4YOokwwr9fs?=
 =?us-ascii?Q?TCzax3IUKUTo7kcP/C+FOfODKEwXvtszG/IkFibK4tHM2hvnDsFQxOC5rrSe?=
 =?us-ascii?Q?39IDbz7ov6DqJVWLLMPHicgBjLsxdUJ6egcLWaZ9aOSbot0c/IMm4d442lcv?=
 =?us-ascii?Q?oe7LxYMBfTsOw0WitkfCVQ/AeqA48aWtesECNhsA21aJw9CRa7PulJGxq6SL?=
 =?us-ascii?Q?+9K9C3PXD6vH3Dd73TY7aSnWeWjZ9S8lf2X2B6nqxOJMOW/uBW5bdn7HuM5K?=
 =?us-ascii?Q?q3AlQuOjYryYHf5zbnnTnXhNh3yOnE0nQU92DY+413DJ8e8F8Nxhb48x81h5?=
 =?us-ascii?Q?4QHBj7ZkPBJmGdVJsWCfrasFPQL99b4RBUm3FuCt4W4ETSvIgSMZF79hGtj4?=
 =?us-ascii?Q?XVMtaocGEdpELsRShp5OQjcBfZVnM7weAfoR8+NnPDpDSMHPu9RP42HeQ/MM?=
 =?us-ascii?Q?6VifeUqkjebcZlbmYbb21M/M+VaYRirfzCNfLkRxrNK1nnPSTisqbLjn+VwD?=
 =?us-ascii?Q?iRdAgaod5RwmvQEAIfKJ8U2q7Bi9TDXj3gsjIBffB3qSM0LGrATisI9vgvLC?=
 =?us-ascii?Q?6eNrUpSrPCR96/+HnX7anSfZrmoSfPAI2dOeor6i9zg2rCnSr3wSTSzSt/7N?=
 =?us-ascii?Q?JtCScNE9vekzVFMMXi/U4GX0F0qBXpZcdoBn5C25J/s/lqfjaxjFSNEPCpRo?=
 =?us-ascii?Q?um2bJB058q+AhvBFqLNezgy63wrLtedw699955M5tEUTy00+xO3TU7Lw977g?=
 =?us-ascii?Q?Ki7wThY9wgxv4IdVb2krplfmVCOTUfBpXsBZtKHokodOkIQ3W+i4G8URoOvf?=
 =?us-ascii?Q?wBR+IqGhEwuXgCW21R/NlYVtsnfd5Zd20V9O4L0N4XnHzy2steFpwykcXqAb?=
 =?us-ascii?Q?0IyGaifUL/BbUuih7yDDcAFpstJmv0Orvb5RVOW3Mssw37xDIsKOaHD6n6j8?=
 =?us-ascii?Q?L2dxNkPprEyqVgXvyeX5I23C7ansEOGT2yxFE1kfBjGtJoKpVWVpD+i/Lt8s?=
 =?us-ascii?Q?o1TWEn99DqNi00m3fmPLMqk8ywhkZCZUV2Jav9E4txLTH7t7wKwUZKROGMPK?=
 =?us-ascii?Q?rOiJvA=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2b2c9e-1703-484f-3077-08db5eacd16c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2023 12:20:54.5261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qif1qLOblT+2Rt+zeOY2vOcnWyv8g80QjRNKwzZ+GNdgt14Epf0u0eDelBDo8YJxlyg8lzsZyOv9Bb+5JFGuWEN0Wwm8hqdIIIF1MxNTQ3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR13MB6143
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Sun, 28 May 2023 08:02:25 +0000
Subject: Re: [Linux-cachefs] [PATCH net-next 1/8] Move
 netfs_extract_iter_to_sg() to lib/scatterlist.c
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
Cc: Jens Axboe <axboe@kernel.dk>, Shyam Prasad N <nspmangalore@gmail.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-cachefs@redhat.com,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: corigine.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 26, 2023 at 03:30:57PM +0100, David Howells wrote:

...

> +/**
> + * netfs_extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
> + * @iter: The iterator to extract from
> + * @maxsize: The amount of iterator to copy
> + * @sgtable: The scatterlist table to fill in
> + * @sg_max: Maximum number of elements in @sgtable that may be filled
> + * @extraction_flags: Flags to qualify the request
> + *
> + * Extract the page fragments from the given amount of the source iterator and
> + * add them to a scatterlist that refers to all of those bits, to a maximum
> + * addition of @sg_max elements.
> + *
> + * The pages referred to by UBUF- and IOVEC-type iterators are extracted and
> + * pinned; BVEC-, KVEC- and XARRAY-type are extracted but aren't pinned; PIPE-
> + * and DISCARD-type are not supported.
> + *
> + * No end mark is placed on the scatterlist; that's left to the caller.
> + *
> + * @extraction_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA
> + * be allowed on the pages extracted.
> + *
> + * If successul, @sgtable->nents is updated to include the number of elements

Hi David,

I know you are just moving things about here.
But if you need to re-spin for some other reason,
perhaps you could correct the spelling of successful.

> + * added and the number of bytes added is returned.  @sgtable->orig_nents is
> + * left unaltered.
> + *
> + * The iov_iter_extract_mode() function should be used to query how cleanup
> + * should be performed.
> + */

...

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

